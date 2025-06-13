extends Level

func _ready() -> void:
	super._ready()
	Global.world_1_unlocked = true
	Global.save_data()
