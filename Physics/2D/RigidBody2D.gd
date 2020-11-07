extends RigidBody2D

var move_vector: Vector2 = Vector2(1, 1)
var speed: float = 1000.0


func _ready():
	pass


func _process(delta):
	#position += Vector2(move_vector.x * delta * speed,move_vector.y * delta * speed)

	if position.y > Autoload.screen_size.y:
		move_vector.y = -1
	elif position.y < 0:
		move_vector.y = 1
	elif position.x > Autoload.screen_size.x:
		move_vector.x = -1
	elif position.x < 0:
		move_vector.x = 1
	apply_impulse(move_vector, Vector2(0, 1))
