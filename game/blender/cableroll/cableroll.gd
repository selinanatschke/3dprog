extends Spatial

onready var cableRollLayer: TextureRect = get_node("/root/Main/Inventory/cableRoll")

func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and cableRollLayer.visible == false:
			print("collected cable roll")
			cableRollLayer.visible = true
			self.visible = false
			$"pickUpSound".play()
