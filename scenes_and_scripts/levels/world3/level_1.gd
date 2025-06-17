extends Level

func _ready() -> void:
	super._ready()
	Global.world_1_unlocked = true
	Global.world_2_unlocked = true
	Global.world_3_unlocked = true
	Global.save_data()
