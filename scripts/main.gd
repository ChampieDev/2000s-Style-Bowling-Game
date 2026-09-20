class_name Main extends Node3D

@onready var player: Player = $Player

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	Global.switch_camera_target.connect(_on_change_camera)
	
func _process(delta: float) -> void:
	var ball = $Player.find_child("BowlingBall", true, false)
	if ball and ball.get_parent() == player:
		ball.reparent(get_tree().current_scene)
	
func _on_change_camera(target):
	print(target)
	match target:
		"Aiming":
			%RemoteTransform3D.reparent($Player)
			%RemoteTransform3D.update_rotation = false
		"Rolling":
			var ball = get_tree().current_scene.find_child("BowlingBall", true, false)
			%RemoteTransform3D.reparent(ball)
			%RemoteTransform3D.update_rotation = false
