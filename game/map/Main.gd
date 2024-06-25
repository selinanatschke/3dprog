extends Node

export (PackedScene) var flying_book_scene
export (PackedScene) var rat_scene

func _ready():
	randomize()
	
	var rat_timer = get_node("RatTimer")
	rat_timer.wait_time = 2.0  # Erhöht das Intervall auf 3 Sekunden
	rat_timer.start()

onready var text: CanvasLayer = get_node("/root/Main/Paper")

func _on_BookTimer_timeout():
	if GlobalVariables.books_flying:
		var book = flying_book_scene.instance()
		var book_spawn_location = get_node("SpawnPath/PathFollow")
		book_spawn_location.unit_offset = randf()
		var player_position = $Player.transform.origin
		book.initialize(book_spawn_location.translation, player_position)
		add_child(book)

func _on_RatTimer_timeout():
	var rat = rat_scene.instance()
	var rat_spawn_location = get_node("SpawnPath/PathFollow")
	rat_spawn_location.unit_offset = randf()
	
	# Setze die Bodenhöhe hier. Zum Beispiel auf Höhe 0.
	var ground_height = 0.0  # Passe diesen Wert je nach deinem Szenen-Setup an.

	var rat_position = rat_spawn_location.translation
	rat_position.y = ground_height  # Setze die Höhe der Ratte auf den Bodenwert.
	
	var player_position = $Player.transform.origin
	rat.initialize(rat_position, player_position)
	add_child(rat)
