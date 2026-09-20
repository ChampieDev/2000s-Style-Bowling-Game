extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	print(ROLLING)
	Global.switch_camera_target.emit(ROLLING)
