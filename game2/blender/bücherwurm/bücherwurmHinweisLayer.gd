extends CanvasLayer

onready var bookWormSound: AudioStreamPlayer = get_node("/root/Main/Buecherwurm/bookWormSound")

func _on_Close_pressed():
	$"pressKeySound".play()
	bookWormSound.stop()
	self.visible = false
