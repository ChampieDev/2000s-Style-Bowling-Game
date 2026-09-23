class_name BowlingBall extends RigidBody3D

var is_thrown: bool = false
var constant_velocity := Vector3.ZERO

func _ready() -> void:
	Global.release_throw.connect(throw, CONNECT_ONE_SHOT)

func throw(force: float):
	var throw_vector = (-global_transform.basis.z) * force
	apply_central_impulse(throw_vector)
	#constant_velocity = -global_transform.basis.z * force
	#is_thrown = true
