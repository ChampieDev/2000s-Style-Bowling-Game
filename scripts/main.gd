class_name Main extends Node3D

@onready var player: Player = $Player2

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	# Global.start_tracking.connect(_on_tracking)
	
func _process(delta: float) -> void:
	var ball = $Player2.find_child("BowlingBall", true, false)
	if ball and ball.get_parent() == player:
		ball.reparent(get_tree().current_scene)

func _on_end_area_body_entered(body: Node3D) -> void:
	if body.name == "BowlingBall":
		Global.stop_tracking.emit(0)
