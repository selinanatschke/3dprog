extends KinematicBody

var gravity = -9.8
var velocity = Vector3()
var camera
var character

const SPEED = 6
const ACCELERATION = 3
const DE_ACCELERATION = 5

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
	
	velocity.y += delta * gravity
	
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
