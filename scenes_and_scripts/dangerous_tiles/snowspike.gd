extends Sprite2D

func _on_area_2d_body_entered(body) -> void:
	if body.is_in_group("Player"):
		body.take_damage(1)
