extends CharacterBody2D

class_name Snowball

var speed = 80
var direction = -1

# This script is from an older thing I made with some edits.

# TODO: Find a way to remove direction without breaking the snowball, doesn't seem to be needed anymore.
# TODO: Add a way for snowballs to be killed by the player.

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

func kill():
	print("The player walked into a Snowball!")
	Global.total_coins = 0
	get_tree().paused = true
	$"/root/EndScreen".visible = true
	await get_tree().create_timer(1).timeout
	get_tree().reload_current_scene()
