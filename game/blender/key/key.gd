extends Spatial

onready var keyLayer: TextureRect = get_node("/root/Main/Inventory/key")
onready var key: Spatial = get_node("/root/Main/Room1/stool2/key")

func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and key.visible == true and keyLayer.visible == false:
			print("pick up key")
			key.visible = false
			keyLayer.visible = true
			
