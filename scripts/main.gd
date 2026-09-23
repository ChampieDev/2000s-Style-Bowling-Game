class_name Main extends Node3D

@onready var player: Player = $Player

var TransitionTween: Tween
var TransitionZoomTween: Tween
var TransitionOffsetTween: Tween


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	Global.switch_camera_target.connect(_on_change_camera)
	
func _process(delta: float) -> void:
	var ball = $Player.find_child("BowlingBall", true, false)
	if ball and ball.get_parent() == player:
		ball.reparent(get_tree().current_scene)
	
func _on_change_camera():
	if $PlayerCamera.is_current():
		$BallCamera.make_current()
	else:
		$PlayerCamera.make_current()
	
	
