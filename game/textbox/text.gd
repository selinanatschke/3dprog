extends CanvasLayer

func _on_Close_pressed():
	self.visible = false
	$"pressKeySound".play()
