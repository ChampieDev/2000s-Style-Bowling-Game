extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	Global.switch_camera_target.emit(AIMING)
	player.velocity = Vector3.ZERO
	# player.animation_player.play("idle)

func physics_update(delta: float) -> void:
	var input_axis = Input.get_axis("left", "right")
	var rotation_axis = Input.get_axis("rotate_left", "rotate_right")
	
	player.velocity.x = input_axis * player.speed
	
	player.rotation.y += rotation_axis * player.speed * delta
	
	if Input.is_action_just_released("throw") and player.can_throw:
		var bb = player.bowling_ball_scene.instantiate()
		player.bowling_ball_spawner.add_child(bb)
		bb.name = "BowlingBall"
		var main = get_tree().current_scene
		bb.reparent(main, true)
		Global.emit_signal("release_throw", player.force)
		player.can_throw = false
		finished.emit(ROLLING)
		
	player.move_and_slide()
