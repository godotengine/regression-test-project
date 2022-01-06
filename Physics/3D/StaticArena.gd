extends Node3D


func _process(delta):
	rotate(Vector3(0, 1, 0).normalized(), 2 * delta)
