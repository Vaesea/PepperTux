extends Snowball

# WARNING!!!!!!!! probably terrible code ahead
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
			$sound.play()
			$Area2D/CollisionShape2D.set_deferred("disabled", true)
			await get_tree().create_timer(1).timeout
			queue_free()
		else:
			body.take_damage(1)
