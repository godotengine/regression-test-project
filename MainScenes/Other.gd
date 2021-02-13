extends Node

var TIME_TO_DELETE : float = 1.0
var time_to_delete : float = TIME_TO_DELETE

func _populate() -> void:
	for _i in range(4):
		add_child(AnimationPlayer.new())
		add_child(AnimationTree.new())
		add_child(AnimationTreePlayer.new())
		add_child(AudioStreamPlayer.new())
		add_child(CanvasLayer.new())
		add_child(ParallaxBackground.new())
		add_child(HTTPRequest.new())
		add_child(ResourcePreloader.new())
		add_child(Skeleton2D.new())
		add_child(Timer.new())
		add_child(Tween.new())
		add_child(Viewport.new())
		add_child(WorldEnvironment.new())

func _ready() -> void:
	_populate()

func _process(delta: float) -> void:
	time_to_delete -= delta
	if time_to_delete < 0:
		time_to_delete += TIME_TO_DELETE
		
		for i in get_children():
			i.queue_free()
			
		_populate()
