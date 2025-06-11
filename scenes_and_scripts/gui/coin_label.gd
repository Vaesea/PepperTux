extends Label

# https://www.youtube.com/watch?v=cvBbkDKT7yI

func _process(_delta: float) -> void:
	$".".text = "x " + str(Global.total_coins)
