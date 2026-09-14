extends RigidBody3D

func throw(force: float):
	var throw_vector = Vector3.FORWARD * force
	apply_central_impulse(throw_vector)
