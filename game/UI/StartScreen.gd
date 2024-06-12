extends CanvasLayer

onready var startScreen: Node = get_node("/root/Main/StartScreen")

func _on_TextureButton2_pressed():
	startScreen.visible = false
	$"AudioStreamPlayer".play()

func _on_TextureButton_pressed():
	get_tree().quit()
	$"AudioStreamPlayer".play()
