extends RigidBody3D

func _ready() -> void:
	Global.release_throw.connect(throw)

func throw(force: float):
	var throw_vector = Vector3.FORWARD * force
	apply_central_impulse(throw_vector)
