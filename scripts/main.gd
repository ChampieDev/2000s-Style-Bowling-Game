class_name Main extends Node3D

@onready var player: Player = $Player2
@onready var power_meter: Control = $PowerMeter/PowerMeter/PowerMeter

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	$PowerMeter.hide()
	Global.start_power.connect(_on_start_power)
	
func _process(delta: float) -> void:
	var ball = $Player2.find_child("BowlingBall", true, false)
	if ball and ball.get_parent() == player:
		ball.reparent(get_tree().current_scene)

func _on_end_area_body_entered(body: Node3D) -> void:
	if body.name == "BowlingBall":
		Global.stop_tracking.emit(0)
		
func _on_start_power():
	$PowerMeter.show()
	power_meter.play_anim("start")
