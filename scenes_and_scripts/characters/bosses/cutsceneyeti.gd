extends CharacterBody2D

func _physics_process(delta: float) -> void:
	velocity += get_gravity() * delta

	move_and_slide()

func stop():
	velocity.x = 0
	$AnimatedSprite2D.play("stand")

func move_right():
	$AnimatedSprite2D.flip_h = false
	velocity.x = 350
	$AnimatedSprite2D.play("walk")

func move_left():
	$AnimatedSprite2D.flip_h = true
	velocity.x = -350
	$AnimatedSprite2D.play("walk")

func jump():
	velocity.y = -400
	$AnimatedSprite2D.play("jump")
