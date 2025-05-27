extends AnimatedSprite2D

var is_collected = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".play("default")

func _on_area_2d_body_entered(body) -> void:
	if body.is_in_group("Player") and not is_collected:
		is_collected = true
		Global.total_coins += 1
		$sound.play()
		hide()
		await get_tree().create_timer(1).timeout
		queue_free()
