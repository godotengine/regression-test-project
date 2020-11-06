extends DirectionalLight3D

var speed = 1.2
var curr = 0


func _process(delta):
	curr += delta * speed

	rotation = Vector3(sin(curr) * speed, cos(curr) * speed, sin(8 * curr) * speed)
