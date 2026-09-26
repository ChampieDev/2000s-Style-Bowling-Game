class_name Player extends Node3D

@onready var display_ball: Node3D = $DisplayBowlingBall

var speed: float = 2.0

var starting_pos := Vector3(0.0, -1.0, -1.5)

enum STATES {
	AIMING,
	POWER_SELECT,
	RELEASE,
	TRACKING,
}

var state: STATES = STATES.AIMING

@export var bowling_ball_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	display_ball.position = starting_pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match state:
		STATES.AIMING:
			
			display_ball.global_position.x = clampf(display_ball.global_position.x, -1.0, 1.0)
			
			var input_axis = Input.get_axis("left", "right")
	
			display_ball.global_position.x += input_axis * speed * delta
			
			if Input.is_action_just_pressed("throw"):
				change_state(STATES.POWER_SELECT)
				
		STATES.POWER_SELECT:
			if Input.is_action_just_pressed("throw"):
				change_state(STATES.RELEASE)
		
		STATES.RELEASE:
			pass

func change_state(new_state: STATES) -> void:
	var prev_state = state
	state = new_state
	
	match new_state:
		STATES.AIMING:
			pass
		STATES.POWER_SELECT:
			$anims.play("start_throw")
		STATES.RELEASE:
			$anims.play("release_throw")
			await $anims.animation_finished
			var b = bowling_ball_scene.instantiate()
			b.position = display_ball.position
			$DisplayBowlingBall.hide()
			add_child(b)
			b.reparent($"..")
			print(b.get_parent().name)
			change_state(STATES.TRACKING)
		STATES.TRACKING:
			Global.start_tracking.emit()
