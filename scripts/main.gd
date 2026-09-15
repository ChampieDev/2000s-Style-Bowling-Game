extends Node3D


func _ready() -> void:
	Global.release_throw.connect(_change_camera)


func _change_camera(_force: float):
	
	await get_tree().process_frame
	
	var ball = find_child("BowlingBall", true, false)
	
	if ball:
		$Player/CameraRemote.reparent(ball)
	else:
		print("Error: No Bowling ball :(")
