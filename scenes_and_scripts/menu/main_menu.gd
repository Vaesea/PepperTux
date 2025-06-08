extends Node2D

func _ready() -> void:
	get_tree().paused = false
	$"/root/GUI".visible = false
	TuxManager.current_state = TuxManager.States.Normal

func _process(_delta: float) -> void:
	# Normal way
	if Input.is_action_just_released("ui_enter"):
		get_tree().change_scene_to_file("res://scenes_and_scripts/levels/world1/level1.tscn")

	# Specific world ways
	if Input.is_key_pressed(KEY_1):
		get_tree().change_scene_to_file("res://scenes_and_scripts/levels/world1/level1.tscn")

	if Input.is_key_pressed(KEY_2):
		OS.alert("World 2 has not been added yet.", "Error")

	if Input.is_key_pressed(KEY_3):
		OS.alert("World 3 has not been added yet.", "Error")

	if Input.is_key_pressed(KEY_4):
		OS.alert("World 4 has not been added yet.", "Error")

	if Input.is_key_pressed(KEY_5):
		OS.alert("World 5 has not been added yet.", "Error")

	if Input.is_key_pressed(KEY_6):
		OS.alert("World 6 has not been added yet.", "Error")

	if Input.is_key_pressed(KEY_7):
		OS.alert("World 7 has not been added yet.", "Error")

	if Input.is_key_pressed(KEY_8):
		OS.alert("World 8 has not been added yet.", "Error")

	if Input.is_key_pressed(KEY_9):
		OS.alert("World 9 has not been added yet.", "Error")

	if Input.is_key_pressed(KEY_A):
		OS.alert("World A has not been added yet.", "Error")

	if Input.is_key_pressed(KEY_B):
		OS.alert("World B has not been added yet.", "Error")

	if Input.is_key_pressed(KEY_C):
		OS.alert("World C has not been added yet.", "Error")

	if Input.is_key_pressed(KEY_D):
		OS.alert("World D has not been added yet.", "Error")
