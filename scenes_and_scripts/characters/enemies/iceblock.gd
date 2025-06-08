extends CharacterBody2D

# Just to prevent shooting while dead
var is_alive = true

# Ice Bullet 
const ice_bullet = preload("res://scenes_and_scripts/characters/enemies/projectiles/ice_bullet.tscn")
var can_shoot = true

# Fireball Death
var fireball_death_jump = -200
var fireball_death_other_thing = -100
@export var cooldown = 1.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("Enemy")
	$AnimatedSprite2D.play("stand")

func _physics_process(delta: float) -> void:
	velocity += get_gravity() * delta
	if can_shoot == true and is_alive == true:
		$AnimatedSprite2D.play("throw")
		shoot()
		await get_tree().create_timer(0.1).timeout
		$AnimatedSprite2D.play("stand")
	move_and_slide()

func squished():
	can_shoot = false
	is_alive = false
	$AnimatedSprite2D.play("squished")
	$sound.play()
	$Area2D/CollisionShape2D.set_deferred("disabled", true)
	await get_tree().create_timer(1).timeout
	queue_free()

func firedeath():
	can_shoot = false
	is_alive = false
	velocity.x = fireball_death_other_thing
	$sound2.play()
	velocity.y += fireball_death_jump
	$AnimatedSprite2D.flip_v = true
	$Area2D/CollisionShape2D.set_deferred("disabled", true)
	$CollisionShape2D.set_deferred("disabled", true)

func _on_area_2d_body_entered(body: Node2D) -> void:
	var thing = body.position.y - position.y
	if body.is_in_group("Player"):
		if thing < -10:
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

func shoot():
	if can_shoot == true and is_alive == true:
		can_shoot = false
		var spawned_bullet = ice_bullet.instantiate()
		get_tree().current_scene.add_child(spawned_bullet)
		spawned_bullet.position = self.position
		spawned_bullet.set_direction(-1)
	await get_tree().create_timer(cooldown).timeout
	can_shoot = true

	if can_shoot == false or is_alive == false:
		return
