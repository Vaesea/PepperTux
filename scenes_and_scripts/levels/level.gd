extends Node2D

class_name Level

func _ready() -> void:
	$"/root/EndScreen".visible = false
	Global.total_coins = 0
	get_tree().paused = false
	TuxManager.health = TuxManager.max_health
