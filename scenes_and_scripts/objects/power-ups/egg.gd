extends CharacterBody2D

func _on_area_2d_body_entered(body) -> void:
	if body.is_in_group("Player"):
		TuxManager.health += 1
		$sound.play()
		hide()
		$Area2D.set_deferred("monitoring", false)
		$Area2D.set_deferred("monitorable", false)
		await get_tree().create_timer(2).timeout
		queue_free()
