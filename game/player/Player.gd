extends KinematicBody

var gravity = -20  # Erhöhte Schwerkraft für schnellere Fallgeschwindigkeit
var velocity = Vector3()
var camera
var character
var is_jumping = false
var jump_force = 3

# Vertical impulse applied to the character upon bouncing over a book in meters per second.
export var bounce_impulse = 16

const SPEED = 6  # Erhöhte Bewegungsgeschwindigkeit
const ACCELERATION = 3  # Erhöhte Beschleunigung
const DE_ACCELERATION = 3  # Erhöhte Verzögerung
const MAX_JUMP_FORCE = 5  # Maximale Sprungkraft
const JUMP_INCREMENT = 100  # Die Rate, mit der die Sprungkraft erhöht wird

func _ready(): 
	character = get_node(".")
	# Set an initial rotation for the character
	character.rotation_degrees.y = 180  # TODO fix wrong direction

func _physics_process(delta):
	camera = get_node("target/Camera").get_global_transform()
	var dir = Vector3()
	
	var is_moving = false
	
	if Input.is_action_pressed("move_forward"):
		dir += -camera.basis.z
		is_moving = true
	if Input.is_action_pressed("move_back"):
		dir += camera.basis.z
		is_moving = true
	if Input.is_action_pressed("move_left"):
		dir += -camera.basis.x
		is_moving = true
	if Input.is_action_pressed("move_right"):
		dir += camera.basis.x
		is_moving = true
		
	dir.y = 0
	dir = dir.normalized()
	
	# Apply gravity
	if not is_on_floor():
		velocity.y += delta * gravity
	else:
		# Reset jump force when on the floor
		if not Input.is_action_pressed("jump"):
			jump_force = 0
			is_jumping = false
			
	# Handle jumping
	if Input.is_action_pressed("jump"):
		if is_on_floor() and not is_jumping:
			is_jumping = true
		if is_jumping:
			jump_force += JUMP_INCREMENT * delta
			jump_force = min(jump_force, MAX_JUMP_FORCE)
			velocity.y = jump_force
	
	if not Input.is_action_pressed("jump") and is_jumping:
		is_jumping = false

	var hv = velocity
	hv.y = 0
	
	var new_pos = dir * SPEED
	var accel = DE_ACCELERATION
	
	if (dir.dot(hv) > 0): 
		accel = ACCELERATION
		
	hv = hv.linear_interpolate(new_pos, accel * delta)
	
	velocity.x = hv.x
	velocity.z = hv.z
	
	velocity = move_and_slide(velocity, Vector3(0,1,0))
	
	if is_moving: 
		# Rotate player to direction
		var angle = atan2(dir.x, dir.z)
		var char_rot = character.get_rotation()
		
		char_rot.y = angle
		character.rotation_degrees.y = angle * 180 / PI  # Update the character's rotation

	for index in range(get_slide_count()):
		# We check every collision that occurred this frame.
		var collision = get_slide_collision(index)
		# If we collide with a monster...
		if collision.collider.is_in_group("mob"):
			var book = collision.collider
			# ...we squash it and bounce if hitting from above.
			if Vector3.UP.dot(collision.normal) > 0.1:
				velocity.y = bounce_impulse
			# Always squash the book, regardless of collision direction.
			book.squash()
			$"bookSquashSound".play()
			
		if collision.collider.is_in_group("collision"):
			print("collide")
			#$"collisionSound".play()

