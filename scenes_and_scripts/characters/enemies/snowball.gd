extends Snowball

# Do NOT put VisibleOnScreenEnabler2D at any other place than the bottom of the list of nodes.

func _on_area_2d_body_entered(body) -> void:
	var thing = body.global_position.y - global_position.y # can someone help with finding a good name for this variable
	if body.is_in_group("Player"):
		if thing < -10:
			squished()
			if Input.is_action_pressed("player_jump"):
				body.velocity.y = -512
			else:
				body.velocity.y = -256
		else:
			body.take_damage(1)
			if TuxManager.current_state == TuxManager.States.Fire:
				TuxManager.current_state = TuxManager.States.Normal
 
	if body.is_in_group("FireBullet"):
		firedeath()
		body.queue_free()

	if body.is_in_group("IceBullet"):
		body.queue_free()
