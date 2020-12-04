extends Node


func _ready() -> void:
	for _i in range(10):
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
