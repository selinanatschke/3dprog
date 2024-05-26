extends Spatial

onready var cableRollLayer: TextureRect = get_node("/root/Main/CableRollLayer/cableRoll")
onready var keyLayer: TextureRect = get_node("/root/Main/CableRollLayer/key")
onready var cableRoll: Spatial = get_node("/root/Main/Room1/Tresor-offen/cableroll")
onready var key: Spatial = get_node("/root/Main/Room1/Tresor-offen/key")

func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and cableRollLayer.visible == false:
			print("collected cable roll")
			cableRollLayer.visible = true
			cableRoll.visible = false
			key.visible = false
			keyLayer.visible = true
