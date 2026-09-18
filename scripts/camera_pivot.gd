extends Node3D

@onready var spring_arm: SpringArm3D = $SpringArm3D

var target: Node3D = null

func _ready() -> void:
	Global.switch_camera_target.connect(switch_target)

func _process(delta: float) -> void:
	if target:
		global_position = global_position.lerp(target.global_position, 5.0)
		
func switch_target(new_target: Node3D) -> void:
	target = new_target

func _unhandled_input(event: InputEvent) -> void:
	pass
	#if event is InputEventMouseMotion:
		#rotate_y(-event.relative.x * 0.005)
		#spring_arm.rotate_x(-event.relative.y * 0.005)
		#spring_arm.rotation.x = clamp(spring_arm.rotation.x, -PI/4, PI/4)
