extends CharacterBody2D

# https://www.youtube.com/watch?v=aQazVHDztsg

# so basically im not trying to make a supertux milestone 1 port / remake to godot (if you want that, play supertux classic)

# this is meant to be a supertux fangame where it's like supertux with new levels and in a different thing, 
# this one being in godot.

# there will be a health system (similar to retux) and the way to get more health is to touch egg power-ups

# there will be multiple worlds (8 of them?)

# TODO: duck when the player holds down. i have no idea how to do this
# TODO: fix the animation stuff. player doesn't go into walking animation when walking left.

var walk_speed = 320.0
var acceleration = 0.1
var deceleration = 0.07
var jump_force = -576.0
var low_jump_force = -512.0
var decelerate_on_jump_release = 0.01

# Adds to player group.
func _ready() -> void:
	add_to_group("Player")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("player_jump") and is_on_floor():
		var current_speed = velocity.x
		if current_speed == 320.0 or current_speed == -320.0: # there has to be a better way to do this.
			velocity.y = jump_force # full jump
		else:
			velocity.y = low_jump_force # low jump

	if Input.is_action_just_released("player_jump") and velocity.y < 0:
		velocity.y *= decelerate_on_jump_release

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("player_left", "player_right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * walk_speed, walk_speed * acceleration)
	else:
		velocity.x = move_toward(velocity.x, 0, walk_speed * deceleration)

	if not is_on_floor():
		$AnimatedSprite2D.play("jump")
	elif velocity.x > 0 and not is_on_wall() or velocity.x < 0: # stupid
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("idle")

	if is_on_wall() and is_on_floor(): # just so the player doesn't walk into a wall and keep walking.
		$AnimatedSprite2D.play("idle")

	if Input.is_action_just_pressed("player_left"):
		$AnimatedSprite2D.flip_h = true

	if Input.is_action_just_pressed("player_right"):
		$AnimatedSprite2D.flip_h = false

	move_and_slide()
