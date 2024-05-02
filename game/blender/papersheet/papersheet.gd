extends Spatial

onready var text: CanvasLayer = get_node("/root/Main/CanvasLayer")

func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and text.visible == false:
			print("paper pressed")

			text.visible = true
