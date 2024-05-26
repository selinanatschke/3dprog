extends Spatial

onready var monitor: Spatial = get_node("/root/Main/MainRoom/furniture/monitor_flat")
onready var cableRollLayer: TextureRect = get_node("/root/Main/CableRollLayer/cableRoll")

func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and monitor.visible == false and cableRollLayer.visible == true:
			print("broken monitor pressed")
			monitor.visible = true
			self.visible = false
			cableRollLayer.visible = false
			
