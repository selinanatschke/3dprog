extends CanvasLayer

func _on_TextureButton_pressed():
	pass

func _on_Close_pressed():
	$"AudioStreamPlayer".play()
	self.visible = false
