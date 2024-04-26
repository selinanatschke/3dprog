extends Spatial

onready var hp_glowing: Node = get_parent().get_node("SybolHP-leuchtend")
onready var door_object: Node = get_node("/root/Main/MainRoom/Doorway/door/SymbolHPnormal")
onready var door_object_glowing: Node = get_node("/root/Main/MainRoom/Doorway/door/SymbolHPleuchtend")

func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true:
			print("pressed mouse button")
			self.visible = false
			hp_glowing.visible = true
			door_object.visible = false
			door_object_glowing.visible = true
			
			
