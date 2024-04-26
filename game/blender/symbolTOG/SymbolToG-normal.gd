extends Spatial

onready var object_to_hide: Node = get_parent().get_node("SymbolToG-leuchtend")
onready var door_object: Node = get_node("/root/Main/MainRoom/Doorway/door/SymbolTOGnormal")
onready var door_object_glowing: Node = get_node("/root/Main/MainRoom/Doorway/door/SymbolTOGleuchtend")

func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true:
			print("pressed mouse button")
			self.visible = false
			object_to_hide.visible = true
			door_object.visible = false
			door_object_glowing.visible = true
			
