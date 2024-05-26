extends Spatial

onready var cableRollLayer: CanvasLayer = get_node("/root/Main/CableRollLayer")
onready var cableRoll: Spatial = get_node("/root/Main/Room1/Tresor-offen/cableroll")

func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and cableRollLayer.visible == false:
			print("collected cable roll")
			cableRollLayer.visible = true
			cableRoll.visible = false
