extends CharacterBody2D

var speed = 280

var direction = -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("IceBullet")
	velocity.y = -300
	$AnimationPlayer.play("rotation")

func set_direction(direction2):
	direction = direction2

func _physics_process(delta: float) -> void:
	velocity += get_gravity() * delta
	velocity.x = speed * direction
	
	move_and_slide()

func _on_area_2d_body_entered(body) -> void:
	if body.is_in_group("Player"):
		body.take_damage(1)
		if TuxManager.current_state == TuxManager.States.Fire:
			TuxManager.current_state = TuxManager.States.Normal
		queue_free()
	if body.is_in_group("Enemy"):
		queue_free()
