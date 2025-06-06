extends CharacterBody2D

class_name Tux

# https://www.youtube.com/watch?v=aQazVHDztsg
# https://www.youtube.com/playlist?list=PLMb6Yv6-w-RWngEjn_YeMzVwgyXBZ73Bf
# https://www.youtube.com/watch?v=M3BKy83wJ-g

# Firing something like fireball or ice bullet
var is_firing = false
var can_fire = true

# Movement
var walk_speed = 320.0
var acceleration = 0.1
var deceleration = 0.07
var jump_force = -576.0
var low_jump_force = -512.0
var decelerate_on_jump_release = 0.01

# Direction
var facing_direction = 1

# Fireball
const fire = preload("res://scenes_and_scripts/objects/power-ups/fire.tscn")

# Adds to player group and makes the health be the max health.
func _ready() -> void:
	add_to_group("Player")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("player_jump") and is_on_floor():
		$jumpsound.play()
		var current_speed = velocity.x
		if current_speed == 320.0 or current_speed == -320.0:
			velocity.y = jump_force
		else:
			velocity.y = low_jump_force

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
		$Hat.play("idle")
	elif velocity.x > 0 and not is_on_wall() or velocity.x < 0: # stupid
		$AnimatedSprite2D.play("walk")
		$Hat.play("walk")
	else:
		$AnimatedSprite2D.play("idle")
		$Hat.play("idle")

	if is_on_wall() and is_on_floor(): # just so the player doesn't walk into a wall and keep walking.
		$AnimatedSprite2D.play("idle")
		$Hat.play("idle")

	if not direction == 0:
		$AnimatedSprite2D.flip_h = direction < 0
		$Hat.flip_h = direction < 0

	if TuxManager.current_state == TuxManager.States.Normal:
		$Hat.visible = false
	elif TuxManager.current_state == TuxManager.States.Fire:
		$Hat.visible = true

	if TuxManager.current_state == TuxManager.States.Fire and Input.is_action_just_pressed("player_action"):
		fireball()

	# i cant use direction so i use facing_direction.
	if direction == 1:
		facing_direction = 1

	if direction == -1:
		facing_direction = -1

	move_and_slide()

func take_damage(damage_amount: int):
	if TuxManager.can_take_damage == true:
		iframes()

		TuxManager.health -= damage_amount

		$hurtsound.play()

		if TuxManager.health <= 0:
			die()

func die():
	print("The player died!")
	Global.total_coins = 0
	get_tree().paused = true
	$hurtsound.play()
	$"/root/EndScreen".visible = true
	await get_tree().create_timer(1).timeout
	get_tree().reload_current_scene()

func iframes():
	TuxManager.can_take_damage = false
	await get_tree().create_timer(0.5).timeout
	TuxManager.can_take_damage = true

func fireball():
	if can_fire == true:
		can_fire = false
		var fire2 = fire.instantiate()
		get_tree().current_scene.add_child(fire2)
		if facing_direction == 1:
			fire2.position = self.position + Vector2(20, -10)
			fire2.set_direction(1)
			
		elif facing_direction == -1:
			fire2.position = self.position + Vector2(-20, -10)
			fire2.set_direction(-1)
		await get_tree().create_timer(1).timeout
		can_fire = true
	
	if can_fire == false:
		return
