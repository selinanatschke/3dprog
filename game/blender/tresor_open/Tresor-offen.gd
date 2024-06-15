extends Spatial

onready var cableRollLayer: TextureRect = get_node("/root/Main/Inventory/cableRoll")
onready var cableRoll: Spatial = get_node("/root/Main/Room1/Tresor-offen/cableroll")

func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and cableRollLayer.visible == false:
			print("collected cable roll")
			$"pickUpSound".play()
			cableRollLayer.visible = true
			cableRoll.visible = false
			GlobalVariables.books_flying = false
		
