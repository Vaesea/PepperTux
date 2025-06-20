extends Node2D

func _ready() -> void:
	Global.load_data()
	get_tree().paused = false
	$"/root/GUI".visible = false
	TuxManager.current_state = TuxManager.States.Normal

func _process(_delta: float) -> void:
	# Normal way
	if Input.is_action_just_released("ui_enter"):
		get_tree().change_scene_to_file("res://scenes_and_scripts/levels/world1/level1.tscn")
	
	# Specific world ways
	if Input.is_key_pressed(KEY_1) and Global.world_1_unlocked == true:
		get_tree().change_scene_to_file("res://scenes_and_scripts/levels/world1/level1.tscn")
	
	if Input.is_key_pressed(KEY_2) and Global.world_2_unlocked == true:
		get_tree().change_scene_to_file("res://scenes_and_scripts/levels/world2/level1.tscn")
	elif Input.is_key_pressed(KEY_2) and Global.world_2_unlocked == false:
		OS.alert("You need to unlock World 2!", "Error")
	
	if Input.is_key_pressed(KEY_3) and Global.world_3_unlocked == true:
		get_tree().change_scene_to_file("res://scenes_and_scripts/levels/world3/level1.tscn")
	elif Input.is_key_pressed(KEY_3) and Global.world_3_unlocked == false:
		OS.alert("You need to unlock World 3!", "Error")
	
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
