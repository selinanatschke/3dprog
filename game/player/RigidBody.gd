extends RigidBody



func _on_RigidBody_body_entered(body):
	$"../collisionSound".play()


func _on_collisionSound_finished():
	pass # Replace with function body.
