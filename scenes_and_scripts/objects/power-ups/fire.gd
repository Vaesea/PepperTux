extends CharacterBody2D

var speed = 360
var direction = 1
var jump = -240
var how_many_times_jumped = 0
var how_many_times_can_jump = 2

func _ready() -> void:
	add_to_group("FireBullet")
	$AnimatedSprite2D.play("default")

func set_direction(direction2):
	direction = direction2

func _physics_process(delta: float) -> void:
	velocity += get_gravity() * delta
	velocity.x = speed * direction
	
	if is_on_floor():
		how_many_times_jumped += 1
		velocity.y = jump
	
	if how_many_times_jumped == how_many_times_can_jump or is_on_wall() or is_on_ceiling():
		queue_free()

	move_and_slide()

func _on_area_2d_body_entered(body) -> void:
	if body.is_in_group("Enemy") or body.is_in_group("Player"):
		queue_free()
