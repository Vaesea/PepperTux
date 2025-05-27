extends Node2D

# The SuperTux logo is a placeholder.

func _physics_process(delta: float) -> void:
	if Input.is_action_just_released("ui_enter"):
		get_tree().change_scene_to_file("res://scenes_and_scripts/levels/misc/test.tscn")
