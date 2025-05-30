extends CharacterBody2D

class_name Snowball

var speed = 80
var direction = -1

# This script is from an older thing I made with some edits.

# Might also be useful for Spikys?

# TODO: Find a way to remove direction without breaking the snowball, doesn't seem to be needed anymore.

func _ready() -> void:
	add_to_group("Enemy")
	$AnimatedSprite2D.play("walk")

func _physics_process(delta: float) -> void:
	velocity += get_gravity() * delta

	velocity.x = speed * direction
	
	if $WallDetection.is_colliding():
		flip()

	move_and_slide()
	
func flip():
	speed *= -1
	$AnimatedSprite2D.flip_h = !$AnimatedSprite2D.flip_h
	$WallDetection.target_position.x *= -1

func squished():
	speed = 0
	$AnimatedSprite2D.play("squished")
