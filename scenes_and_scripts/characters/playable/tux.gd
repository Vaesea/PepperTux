extends CharacterBody2D

class_name Tux

# https://www.youtube.com/watch?v=aQazVHDztsg
# https://www.youtube.com/playlist?list=PLMb6Yv6-w-RWngEjn_YeMzVwgyXBZ73Bf

enum States {NORMAL, FIRE}

var max_health = 3
var health = 0
var can_take_damage = true

var walk_speed = 320.0
var acceleration = 0.1
var deceleration = 0.07
var jump_force = -576.0
var low_jump_force = -512.0
var decelerate_on_jump_release = 0.01

# Adds to player group.
func _ready() -> void:
	health = max_health
	add_to_group("Player")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("player_jump") and is_on_floor():
		$jumpsound.play()
		var current_speed = velocity.x
		if current_speed == 320.0 or current_speed == -320.0: # there has to be a better way to do this.
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

func take_damage(damage_amount: int):
	if can_take_damage == true:
		iframes()
		
		health -= damage_amount
		
		$hurtsound.play()
		
		if health <= 0:
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
	can_take_damage = false
	await get_tree().create_timer(0.5).timeout
	can_take_damage = true
