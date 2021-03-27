extends Camera3D

var speed = 1
var curr = 0


func _process(delta):
	curr += delta * speed

	look_at_from_position(Vector3(cos(curr) * 3, 0, sin(curr) * 3), Vector3.ZERO, Vector3(0, 1, 0))
