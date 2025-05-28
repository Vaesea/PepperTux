extends CharacterBody2D

var jump_height = 512

func _physics_process(delta: float) -> void:
	velocity += get_gravity() * delta
	
	if is_on_floor():
		$AnimatedSprite2D.stop()
		velocity.y = -jump_height
		$AnimatedSprite2D.play("default")
	
	move_and_slide()
