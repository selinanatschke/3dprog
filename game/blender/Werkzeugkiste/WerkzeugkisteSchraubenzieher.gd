extends Spatial

onready var werkzeugkiste_leer: Spatial = get_node("/root/Main/Room2/Werkzeugkiste")
onready var schraubenzieherLayer: TextureRect = get_node("/root/Main/Inventory/Schraubenzieher")

func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and werkzeugkiste_leer.visible == false and self.visible == true and schraubenzieherLayer.visible == false:
			print("pick up schraubenzieher")
			self.visible = false
			werkzeugkiste_leer.visible = true
			schraubenzieherLayer.visible = true
			$"pickUpSound".play()
