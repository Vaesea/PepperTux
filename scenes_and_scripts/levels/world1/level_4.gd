extends Level

func _on_yeti_cutscene_start_body_entered(body) -> void:
	if body.is_in_group("Player"):
		body.stop()
		body.face_right()
		$AudioStreamPlayer.stop()
		await get_tree().create_timer(0.5).timeout
		$CutsceneYeti.move_right()
		await get_tree().create_timer(0.325).timeout
		$CutsceneYeti.stop()
		body.face_left()
		await get_tree().create_timer(1).timeout
		$CutsceneYeti/roar.play()
		$CutsceneYeti.jump()
		await get_tree().create_timer(0.88).timeout
		$CutsceneYeti.move_right()
		body.move_right()
		await get_tree().create_timer(1.5).timeout
		$EndScreen.visible = true
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://scenes_and_scripts/levels/world2/level1.tscn")
