extends Spatial

onready var buecherwurmLayer: CanvasLayer = get_node("/root/Main/BücherwurmLayer")

func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and buecherwurmLayer.visible == false:
			print("bücherwurm clicked")
			GlobalVariables.steps = 0
			buecherwurmLayer.visible = true

