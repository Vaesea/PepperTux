extends AnimatedSprite2D

func _process(_delta: float) -> void:
	if TuxManager.health == 3:
		$".".play("3")
	elif TuxManager.health == 2:
		$".".play("2")
	elif TuxManager.health == 1:
		$".".play("1")
	elif TuxManager.health == 0:
		$".".play("0")
