extends Spatial

onready var schlossLayer: CanvasLayer = get_node("/root/Main/Schloss")
onready var paperFromBookLayer: CanvasLayer = get_node("/root/Main/PaperFromBook")
onready var keyLayer: TextureRect = get_node("/root/Main/Inventory/key")

func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and schlossLayer.visible == false and keyLayer.visible == false:
			print("old book pressed without key")
			schlossLayer.visible = true
			$"openBookSoundClosed".play()
		elif event.button_index == BUTTON_LEFT and event.pressed and schlossLayer.visible == false and keyLayer.visible == true: 
			print("old book pressed with key")
			paperFromBookLayer.visible = true
			keyLayer.visible = false
			$"openBookSound".play()
			
