extends PointLight2D

var move_vector: Vector2 = Vector2(1, 1)
var speed: float = 100.0


func _process(delta):
	position += Vector2(move_vector.x * delta * speed, move_vector.y * delta * speed)
	rotation += speed * delta

	if position.y > Autoload.screen_size.y:
		move_vector.y = -1
	elif position.y < 0:
		move_vector.y = 1
	elif position.x > Autoload.screen_size.x:
		move_vector.x = -1
	elif position.x < 0:
		move_vector.x = 1
