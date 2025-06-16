extends Snowball

func _on_area_2d_body_entered(body) -> void:
	var thing = body.global_position.y - global_position.y # can someone help with finding a good name for this variable
	if body.is_in_group("Player"):
		body.take_damage(1)
		if TuxManager.current_state == TuxManager.States.Fire:
			TuxManager.current_state = TuxManager.States.Normal
 
	if body.is_in_group("FireBullet"):
		firedeath()
		body.queue_free()

	if body.is_in_group("IceBullet"):
		body.queue_free()
