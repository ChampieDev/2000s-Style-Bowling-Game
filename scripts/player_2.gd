class_name Player extends Node3D

@onready var display_ball: Node3D = $DisplayBowlingBall
var b: Node3D = null

var speed: float = 2.0

var starting_pos := Vector3(0.0, -1.0, -1.5)

enum STATES {
	AIMING,
	POWER_SELECT,
	RELEASE,
	TRACKING,
	IDLE,
}

var state: STATES = STATES.AIMING

@export var bowling_ball_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	display_ball.position = starting_pos
	Global.stop_tracking.connect(change_state, STATES.IDLE)

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
			
		STATES.TRACKING:
			self.global_position.z = b.global_position.z + 4.0

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
			b = bowling_ball_scene.instantiate()
			b.position = display_ball.position
			$DisplayBowlingBall.hide()
			add_child(b)
			b.reparent($"..")
			print(b.get_parent().name)
			await get_tree().create_timer(0.15).timeout
			change_state(STATES.TRACKING)
		STATES.TRACKING:
			Global.start_tracking.emit()
