class_name Player extends Node3D

@onready var display_ball: Node3D = $DisplayBowlingBall
var b: Node3D = null

var speed: float = 2.0

var starting_pos := Vector3(0.0, -1.0, -1.5)

var position_diffrence: float

var force: float

var charge: float

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
			
			if input_axis:
				display_ball.global_position.x += input_axis * speed * delta
				Global.set_disp_ball_trans.emit(true)
			else:
				Global.set_disp_ball_trans.emit(false)
			
			if Input.is_action_just_pressed("throw"):
				change_state(STATES.POWER_SELECT)
				
		STATES.POWER_SELECT:
			Global.set_disp_ball_trans.emit(false)
			if Input.is_action_just_pressed("throw"):
				change_state(STATES.RELEASE)
		
		STATES.RELEASE:
			pass
			
		STATES.TRACKING:
			self.global_position.z = b.global_position.z + position_diffrence

func change_state(new_state: STATES) -> void:
	var prev_state = state
	state = new_state
	
	match new_state:
		STATES.AIMING:
			pass
		STATES.POWER_SELECT:
			$anims.play("start_throw")
			Global.start_power.emit()
		STATES.RELEASE:
			$"../PowerMeter/PowerMeter/PowerMeter".anims.pause()
			charge = snapped(($"../PowerMeter/PowerMeter/PowerMeter".p_value * 0.1), 0.1) + 0.1
			force = charge / (charge + 3.0)
			print(force)
			if force <= 0.3:
				force = 0.3
			$anims.play("release_throw")
			await $anims.animation_finished
			b = bowling_ball_scene.instantiate()
			b.position = display_ball.position
			$DisplayBowlingBall.hide()
			add_child(b)
			b.reparent($"..")
			b.throw(force * 10.0)
			await get_tree().create_timer(0.15).timeout
			change_state(STATES.TRACKING)
		STATES.TRACKING:
			Global.start_tracking.emit()
			position_diffrence = self.global_position.z - b.global_position.z
