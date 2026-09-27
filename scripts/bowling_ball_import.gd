extends Node3D

@export var bowling_ball_texture: StandardMaterial3D

func _ready() -> void:
	Global.set_disp_ball_trans.connect(_on_set_trans)
	_on_set_trans(false)
	
func _on_set_trans(value: bool):
	if value:
		bowling_ball_texture.albedo_color.a = lerp(bowling_ball_texture.albedo_color.a, 0.5, 0.25)
	else:
		bowling_ball_texture.albedo_color.a = lerp(bowling_ball_texture.albedo_color.a, 1.0, 0.25)
