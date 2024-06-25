extends Spatial

var solved: bool = false
onready var tresor_open: Spatial = get_node("/root/Main/Room1/Tresor-offen")
onready var tresor_input: CanvasLayer = get_node("/root/Main/TresorInput")

func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and tresor_open.visible == false:
			print("closed tresor pressed pressed")

			if (solved):
				self.visible = false
				tresor_open.visible = true
			else: 
				tresor_input.visible = true
