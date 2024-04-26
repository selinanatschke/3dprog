extends Spatial

onready var hp_glowing: Node = get_parent().get_node("SybolHP-leuchtend")
onready var door_object: Node = get_node("/root/Main/MainRoom/Doorway/door/SymbolHPnormal")
onready var door_object_glowing: Node = get_node("/root/Main/MainRoom/Doorway/door/SymbolHPleuchtend")
onready var door_object_glowing2: Node = get_node("/root/Main/MainRoom/Doorway/door/SymbolTOGleuchtend")
onready var door: Node = get_node("/root/Main/MainRoom/Doorway/door")

func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true:
			print("pressed mouse button")
			self.visible = false
			hp_glowing.visible = true
			door_object.visible = false
			door_object_glowing.visible = true
			
		if door_object_glowing.visible == true and door_object_glowing2.visible == true:
			door.translation = Vector3(16.604, 4.309, 20.711)
			door.rotation_degrees = Vector3(0, 80, 0)
