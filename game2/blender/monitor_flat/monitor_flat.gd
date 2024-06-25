extends Spatial

onready var monitorLayer: CanvasLayer = get_node("/root/Main/Monitor")

func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and monitorLayer.visible == false:
			print("monitor pressed")

			monitorLayer.visible = true
			$"openSound".play()
