extends Node3D

var tracking

func _process(delta: float) -> void:
	if tracking:
		global_position = tracking.global_position
