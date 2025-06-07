extends Node2D

func _ready() -> void:
	get_tree().paused = false
	$"/root/GUI".visible = false
	TuxManager.current_state = TuxManager.States.Normal

func _process(_delta: float) -> void:
	if Input.is_action_just_released("ui_enter"):
		get_tree().change_scene_to_file("res://scenes_and_scripts/levels/misc/test.tscn")
