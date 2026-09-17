class_name Player extends CharacterBody3D

var speed: int = 12

var force: float = 15.0

var can_throw: bool = true

@export var bowling_ball_scene: PackedScene

func _process(delta: float) -> void:
	
	var input_axis = Input.get_axis("left", "right")
	
	velocity.x = input_axis * speed
	
	if Input.is_action_just_released("throw") and can_throw:
		var bb = bowling_ball_scene.instantiate()
		$BowlingBallSpawner.add_child(bb)
		bb.name = "BowlingBall"
		bb.reparent($"..", true)
		Global.emit_signal("release_throw", force)
		can_throw = false
	
	move_and_slide()
	
