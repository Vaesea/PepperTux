extends CharacterBody2D

class_name Snowball

# Movement
var speed = 80
var direction = -1

# Fireball Death
var fireball_death_jump = -200
var fireball_death_other_thing = -100

# This script is from an older thing I made with some edits.

# Might also be useful for Spikys?

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
	$sound.play()
	$Area2D/CollisionShape2D.set_deferred("disabled", true)
	await get_tree().create_timer(1).timeout
	queue_free()

func firedeath():
	speed = fireball_death_other_thing
	$sound2.play()
	velocity.y += fireball_death_jump
	$AnimatedSprite2D.flip_v = true
	$Area2D/CollisionShape2D.set_deferred("disabled", true)
	$CollisionShape2D.set_deferred("disabled", true)
