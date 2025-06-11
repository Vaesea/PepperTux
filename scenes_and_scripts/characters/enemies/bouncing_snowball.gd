extends Snowball

var jump_height = 512

var dead = false

func _physics_process(delta: float) -> void:
	super._physics_process(delta)

	if is_on_floor() and dead == false:
		velocity.y = -jump_height

func _on_area_2d_body_entered(body: Node2D) -> void:
	var thing = body.position.y - position.y
	if body.is_in_group("Player"):
		if thing < -10:
			dead = true
			velocity.y = 100
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
