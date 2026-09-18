class_name BowlingBall extends RigidBody3D

func _ready() -> void:
	Global.release_throw.connect(throw)

func throw(force: float):
	var throw_vector = (-global_transform.basis.z) * force
	apply_central_impulse(throw_vector)
