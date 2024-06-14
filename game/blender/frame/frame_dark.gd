extends Spatial

onready var picture_glowing: Node = get_node("/root/Main/Symbols/frame_dark/OmniLight")
onready var picture: Node = get_parent().get_node("frame_dark")
onready var door_object: Node = get_node("/root/Main/MainRoom/Doorway/door/Symbol3")
onready var door_object_glowing: Node = get_node("/root/Main/MainRoom/Doorway/door/Symbol3leuchtend")
onready var door_object_glowing2: Node = get_node("/root/Main/MainRoom/Doorway/door/SymbolTOGleuchtend")
onready var door_object_glowing3: Node = get_node("/root/Main/MainRoom/Doorway/door/SymbolHPleuchtend")
onready var door: Node = get_node("/root/Main/MainRoom/Doorway/door")

func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true:
			print("pressed dark image", self.visible)
			print("pressed dark image2", picture_glowing.visible)
			self.visible = false
			picture.visible = true
			door_object.visible = false
			door_object_glowing.visible = true
			picture_glowing.visible = true
			
		if door_object_glowing.visible == true and door_object_glowing2.visible == true and door_object_glowing3.visible:
			door.translation = Vector3(16.604, 4.309, 20.711)
			door.rotation_degrees = Vector3(0, 80, 0)
			GlobalVariables.books_flying = true
