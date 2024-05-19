extends Node

export (PackedScene) var flying_book_scene


func _ready():
	randomize()
onready var text: CanvasLayer = get_node("/root/Main/Paper")

func _on_BookTimer_timeout():
	# Create a new instance of the Mob scene.
	var book = flying_book_scene.instance()

	# Choose a random location on the SpawnPath.
	# We store the reference to the SpawnLocation node.
	var book_spawn_location = get_node("SpawnPath/PathFollow")
	# And give it a random offset.
	book_spawn_location.unit_offset = randf()

	var player_position = $Player.transform.origin
	book.initialize(book_spawn_location.translation, player_position)

	add_child(book)
