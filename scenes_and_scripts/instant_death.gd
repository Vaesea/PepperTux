extends Area2D

func _ready() -> void:
	$"/root/EndScreen".visible = false

func _on_body_entered(body) -> void:
	if body.is_in_group("Player"):
		print("The player fell into the void!")
		Global.total_coins = 0
		TuxManager.health = 0
		$"/root/GUI".visible = false
		get_tree().paused = true
		$"/root/EndScreen".visible = true
		$sound.play()
		await get_tree().create_timer(1).timeout
		get_tree().reload_current_scene()
