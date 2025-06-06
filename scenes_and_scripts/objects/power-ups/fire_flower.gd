extends CharacterBody2D

# https://www.youtube.com/watch?v=M3BKy83wJ-g

func _on_area_2d_body_entered(body) -> void:
	if body.is_in_group("Player"):
		TuxManager.current_state = TuxManager.States.Fire
		print("Tux is now Fire Tux.")
		queue_free()
