extends Spatial

onready var schlossLayer: CanvasLayer = get_node("/root/Main/Schloss")

func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and schlossLayer.visible == false:
			print("old book pressed")

			schlossLayer.visible = true
