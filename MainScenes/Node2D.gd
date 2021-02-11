extends Node2D

var TIME_TO_DELETE : float = 1.0
var time_to_delete : float = TIME_TO_DELETE

func _populate() -> void:
	for _i in range(4):
		add_child(Node2D.new())
		add_child(AnimatedSprite.new())
		add_child(Area2D.new())
		add_child(KinematicBody2D.new())
		add_child(RigidBody2D.new())
		add_child(StaticBody2D.new())
		add_child(AudioStreamPlayer2D.new())
		add_child(BackBufferCopy.new())
		add_child(Bone2D.new())
		add_child(CPUParticles2D.new())
		add_child(Camera2D.new())
		add_child(CanvasModulate.new())
		add_child(CollisionPolygon2D.new())
		add_child(CollisionShape2D.new())
		add_child(DampedSpringJoint2D.new())
		add_child(GrooveJoint2D.new())
		add_child(PinJoint2D.new())
		add_child(Light2D.new())
		add_child(LightOccluder2D.new())
		add_child(Line2D.new())
		add_child(MeshInstance2D.new())
		add_child(MultiMeshInstance2D.new())
		add_child(Navigation2D.new())
		add_child(NavigationPolygonInstance.new())
		add_child(ParallaxLayer.new())
		add_child(Particles2D.new())
		add_child(Path2D.new())
		add_child(PathFollow2D.new())
		add_child(Polygon2D.new())
		add_child(Position2D.new())
		add_child(RayCast2D.new())
		add_child(RemoteTransform2D.new())
		add_child(Skeleton2D.new())
		add_child(Sprite.new())
		add_child(TileMap.new())
		add_child(TouchScreenButton.new())
		add_child(VisibilityNotifier2D.new())
		add_child(VisibilityEnabler2D.new())
		add_child(YSort.new())

func _ready() -> void:
	_populate()

func _process(delta: float) -> void:
	for i in get_children():
		if i is Node2D:
			i.set_position(Vector2(1000 * randf() - 500, 1000 * randf() - 500))
			
	time_to_delete -= delta
	if time_to_delete < 0:
		time_to_delete += TIME_TO_DELETE
		
		for i in get_children():
			i.queue_free()
			
		_populate()

