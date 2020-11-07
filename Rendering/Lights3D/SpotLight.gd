extends SpotLight

var speed = 0.3
var curr = 0


func _process(delta):
	curr += delta * speed

	look_at_from_position(Vector3(cos(curr) * 3, sin(curr * curr) * 3, sin(curr) * 3), Vector3.ZERO, Vector3(0, 1, 0))
