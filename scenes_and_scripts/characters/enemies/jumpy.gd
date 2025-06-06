extends CharacterBody2D

var jump_height = 512

func _ready() -> void:
	add_to_group("Enemy")

func _physics_process(delta: float) -> void:
	velocity += get_gravity() * delta

	if is_on_floor():
		$AnimatedSprite2D.stop()
		velocity.y = -jump_height
		$AnimatedSprite2D.play("default")

	move_and_slide()

func _on_area_2d_body_entered(body) -> void:
	if body.is_in_group("Player"):
		body.take_damage(1)
		if TuxManager.current_state == TuxManager.States.Fire:
			TuxManager.current_state = TuxManager.States.Normal

	if body.is_in_group("FireBullet"):
		body.queue_free()
