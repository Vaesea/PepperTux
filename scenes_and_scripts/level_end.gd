extends Area2D

@export var scene = "res://scenes_and_scripts/levels/misc/test.tscn"

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print("The level is ending.")
		get_tree().paused = true
		$sound.play()
		await get_tree().create_timer(7.8).timeout
		get_tree().change_scene_to_file(scene)
