class_name BowlingBall extends RigidBody3D

var constant_velocity := Vector3.ZERO

func _ready() -> void:
	Global.release_throw.connect(throw, CONNECT_ONE_SHOT)
	throw(20.0)

func throw(force: float):
	var throw_vector = (-global_transform.basis.z) * force
	apply_central_impulse(throw_vector)
