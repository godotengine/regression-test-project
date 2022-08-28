extends RigidDynamicBody3D

func _physics_process(delta: float) -> void:
	add_constant_force(Vector3(0, 4 * delta, 0), Vector3(0, 0, 0))
	pass
