extends Node

# https://www.youtube.com/watch?v=lXO5Jt957BA

var total_coins = 0

# Save Path (ptsf = pepperTux Save File)
var save_path = "user://save.ptsf"

# Unlocked Worlds
var world_1_unlocked = true
var world_2_unlocked = false
var world_3_unlocked = false
var world_4_unlocked = false
var world_5_unlocked = false
var world_6_unlocked = false
var world_7_unlocked = false
var world_8_unlocked = false
var world_9_unlocked = false
var world_10_unlocked = false

func save_data():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(world_1_unlocked)
	file.store_var(world_2_unlocked)
	file.store_var(world_3_unlocked)
	file.store_var(world_4_unlocked)
	file.store_var(world_5_unlocked)
	file.store_var(world_6_unlocked)
	file.store_var(world_7_unlocked)
	file.store_var(world_8_unlocked)
	file.store_var(world_9_unlocked)
	file.store_var(world_10_unlocked)

func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		world_1_unlocked = file.get_var(world_1_unlocked)
		world_2_unlocked = file.get_var(world_2_unlocked)
		world_3_unlocked = file.get_var(world_3_unlocked)
		world_4_unlocked = file.get_var(world_4_unlocked)
		world_5_unlocked = file.get_var(world_5_unlocked)
		world_6_unlocked = file.get_var(world_6_unlocked)
		world_7_unlocked = file.get_var(world_7_unlocked)
		world_8_unlocked = file.get_var(world_8_unlocked)
		world_9_unlocked = file.get_var(world_9_unlocked)
		world_10_unlocked = file.get_var(world_10_unlocked)
	else:
		print("No data saved!")
		world_1_unlocked = true
		world_2_unlocked = false
		world_3_unlocked = false
		world_4_unlocked = false
		world_5_unlocked = false
		world_6_unlocked = false
		world_7_unlocked = false
		world_8_unlocked = false
		world_9_unlocked = false
		world_10_unlocked = false
