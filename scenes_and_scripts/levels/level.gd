extends Node2D

class_name Level

func _ready() -> void:
	Global.total_coins = 0
	get_tree().paused = false
