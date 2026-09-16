extends Node3D

func _ready() -> void:
	# Global.release_throw.connect(_change_camera)
	pass
	
func _process(delta: float) -> void:
	
	var ball = find_child("BowlingBall", true, false)
	
	if ball:
		%CameraPivot.tracking = ball
	else:
		%CameraPivot.tracking = $Player
