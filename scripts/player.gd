class_name Player extends CharacterBody3D

var speed: int = 1

var force: float = 8.0

@export var bowling_ball_scene: PackedScene

func _process(delta: float) -> void:
	
	var input_axis = Input.get_axis("left", "right")
	
	velocity.x = move_toward(velocity.x, input_axis * speed, delta)
	
	if Input.is_action_just_released("throw"):
		var bb = bowling_ball_scene.instantiate()
		$BowlingBallSpawner.add_child(bb)
		bb.name = "BowlingBall"
		bb.reparent($"..", true)
		Global.emit_signal("release_throw", force)
	
	move_and_slide()
	
