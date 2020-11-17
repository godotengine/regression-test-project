extends RigidBody

func _physics_process(delta: float) -> void:
	add_force(Vector3(0,4 * delta ,0),Vector3(0,0,0))
	pass
