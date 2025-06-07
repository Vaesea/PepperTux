extends StaticBody2D

enum bonus_block_content {Coin, Egg, Fire_Flower}

@export var content: bonus_block_content # it has to be : instead of = because it's a drop-down list menu thing or whatever it's called

const egg = preload("res://scenes_and_scripts/objects/power-ups/egg.tscn")
const fire_flower = preload("res://scenes_and_scripts/objects/power-ups/fire_flower.tscn")

func _on_area_2d_body_entered(body) -> void:
	if body.is_in_group("Player"):
		spawn_object()

func spawn_object():
	var position_of_object = self.position + Vector2(0, -32)

	# I lied, we're actually adding a coin, not spawning one. Sorry!
	if content == bonus_block_content.Coin:
		Global.total_coins += 1
		$coin.play()
	
	if content == bonus_block_content.Egg:
		var egg2 = egg.instantiate()
		get_tree().current_scene.add_child(egg2)
		egg2.position = position_of_object
		$upgrade.play()
	
	if content == bonus_block_content.Fire_Flower:
		var ff = fire_flower.instantiate()
		get_tree().current_scene.add_child(ff)
		ff.position = position_of_object
		$upgrade.play()

	$Area2D.set_deferred("monitoring", false)
	$Area2D.set_deferred("monitorable", false)
	$AnimatedSprite2D.play("empty")
	move_up()
	await get_tree().create_timer(0.1).timeout
	move_down()

func move_up():
	var tween = create_tween()
	tween.tween_property(self, "position", position + Vector2(0, -10), 0.1)
	tween.tween_callback(move_down)

func move_down():
	var tween = create_tween()
	tween.tween_property(self, "position", position + Vector2(0, 10), 0.1)
