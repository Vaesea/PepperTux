extends StaticBody2D

@export var snow = false

func _ready() -> void:
	if snow == false:
		$AnimatedSprite2D.play("normal")
	if snow == true:
		$AnimatedSprite2D.play("snow")

func _on_area_2d_body_entered(body) -> void:
	if body.is_in_group("Player"):
		$sound.play()
		$Area2D.set_deferred("monitoring", false)
		$Area2D.set_deferred("monitorable", false)
		move_up()
		await get_tree().create_timer(0.1).timeout
		move_down()
		await get_tree().create_timer(0.1).timeout
		$Area2D.set_deferred("monitoring", true)
		$Area2D.set_deferred("monitorable", true)

func move_up():
	var tween = create_tween()
	tween.tween_property(self, "position", position + Vector2(0, -10), 0.1)
	tween.tween_callback(move_down)

func move_down():
	var tween = create_tween()
	tween.tween_property(self, "position", position + Vector2(0, 10), 0.1)
