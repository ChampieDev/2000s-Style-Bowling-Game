extends CharacterBody3D

var speed: int = 1

var force: float = 0.0

@export var bowling_ball_scene: PackedScene

func _process(delta: float) -> void:
	
	var input_axis = Input.get_axis("left", "right")
	
	velocity.x = move_toward(velocity.x, input_axis * speed, delta)
	
	if Input.is_action_pressed("throw"):
		force = move_toward(force, 5.0, 5.0 * delta)
	if Input.is_action_just_released("throw"):
		var bb = bowling_ball_scene.instantiate()
		$BowlingBallSpawner.add_child(bb)
		bb.reparent($"..", true)
		bb.throw(force)
		force = 0.0
	
	move_and_slide()
	
