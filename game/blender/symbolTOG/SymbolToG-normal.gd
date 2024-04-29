extends Spatial

onready var object_to_hide: Node = get_parent().get_node("SymbolToG-leuchtend")
onready var door_object: Node = get_node("/root/Main/MainRoom/Doorway/door/SymbolTOGnormal")
onready var door_object_glowing: Node = get_node("/root/Main/MainRoom/Doorway/door/SymbolTOGleuchtend")
onready var door_object_glowing2: Node = get_node("/root/Main/MainRoom/Doorway/door/SymbolHPleuchtend")
onready var door_object_glowing3: Node = get_node("/root/Main/MainRoom/Doorway/door/Symbol3leuchtend")
onready var door: Node = get_node("/root/Main/MainRoom/Doorway/door")


func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true:
			print("pressed mouse button", door_object_glowing2.visible)
			self.visible = false
			object_to_hide.visible = true
			door_object.visible = false
			door_object_glowing.visible = true
			
			if door_object_glowing.visible and door_object_glowing2.visible and door_object_glowing3.visible:
				door.translation = Vector3(16.604, 4.309, 20.711)
				door.rotation_degrees = Vector3(0, 80, 0)

			
