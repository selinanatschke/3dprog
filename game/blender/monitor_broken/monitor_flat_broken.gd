extends Spatial

onready var monitor: CanvasLayer = get_node("/root/Main/Monitor")


func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and monitor.visible == false:
			print("monitor pressed")

			monitor.visible = true
