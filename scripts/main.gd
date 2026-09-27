class_name Main extends Node3D

@onready var player: Player = $Player2

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	Global.start_tracking.connect(_on_tracking)
	
func _process(delta: float) -> void:
	var ball = $Player2.find_child("BowlingBall", true, false)
	if ball and ball.get_parent() == player:
		ball.reparent(get_tree().current_scene)
	
func _on_tracking():
	var tween = create_tween()
	tween.tween_property($Player2, "global_position", Vector3(0.0, 1.2, -10.0), 1.3) # 1.3, 0.86
