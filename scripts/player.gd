extends CharacterBody3D

@export var bowling_ball_scene: PackedScene

var speed: float = 2.0

var force: float = randf_range(12.0, 24.0)

enum STATES {
	AIMING,
	POWER_SELECT,
	THROWING,
	TRACKING,
	IDLE,
	}
	
var state: STATES = STATES.IDLE

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("throw"):
		var b = bowling_ball_scene.instantiate()
		add_child(b)
		b.global_position = $BowlingBallSpawner.global_position
		b.reparent($"..", true)
		force = randf_range(12.0, 24.0)
		Global.release_throw.emit(force)
	
	var input_axis = Input.get_axis("left", "right")
	
	velocity.x = speed * input_axis
	
	if input_axis:
		set_state(STATES.AIMING)
	else:
		set_state(STATES.IDLE)
	
	if state == STATES.AIMING:
		speed = 2.0
	else:
		speed = 0.0
		
	move_and_slide()
	
func set_state(new_state: int) -> void:
	var previous_state := state
	state = new_state
