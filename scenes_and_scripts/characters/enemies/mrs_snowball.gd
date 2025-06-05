extends Snowball

# PLEASE READ: im not working on this right here anymore for a long time, instead i'll try work on other things in this game. i've spent too long trying to get it to work. almost did! but then i changed the positions of some stuff which means it no longer works. i've given up completely.

# WARNING!!!!!!!! very terrible code ahead, same as snowball.gd but the snowball is smart

func _ready() -> void:
	super._ready()
	flip()

func _physics_process(delta: float) -> void:
	super._physics_process(delta) # look at what i learned to do today! why is godot so annoying.
	if $GroundDetection.is_colliding() == false and is_on_floor() == true:
		flip()

func _on_area_2d_body_entered(body) -> void:
	var player_above_enemy = body.global_position.y - global_position.y 
	if body.is_in_group("Player"):
		if player_above_enemy < -10:
			squished()
			if Input.is_action_pressed("player_jump"):
				body.velocity.y = -512
			else:
				body.velocity.y = -256
			$sound.play()
			$Area2D/CollisionShape2D.set_deferred("disabled", true)
			await get_tree().create_timer(1).timeout
			queue_free()
		else:
			body.take_damage(1)

func flip():
	super.flip()
	$GroundDetection.target_position.x *= -1
