extends Snowball

# TODO: some sort of error appears when loading the snowball, but everything works fine. i might need someone to help fix that error becasue i have no idea what's going on?

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
