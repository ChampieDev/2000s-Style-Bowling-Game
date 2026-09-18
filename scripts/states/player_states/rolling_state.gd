extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	print(ROLLING)
	Global.change_camera.emit(ROLLING)
