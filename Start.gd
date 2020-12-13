extends Control

var current_scene : int = -1
var time_to_switch : int
const NUMBER_OF_INSTANCES : int = 1 # Use more than 1 to stress test, 1 should be optimal for casual CI

func _ready():
	time_to_switch = Autoload.time_for_each_step
	
	print("Starting with scene(s):")
	for path in  Autoload.all_in_one:
		var scene : Node = load(path).instance()
		add_child(scene)
		print("   - " + path)
	

func _process(_delta):
	if time_to_switch - OS.get_ticks_msec() <= 0:
		time_to_switch = Autoload.time_for_each_step + OS.get_ticks_msec()
		
		if current_scene < Autoload.alone_steps.size() - 1:
			current_scene += 1
			
			for child in get_children():
				child.queue_free()
			
			print("Changed scene to " + Autoload.alone_steps[current_scene])
			
			for _i in range(NUMBER_OF_INSTANCES):
				var scene : Node = load(Autoload.alone_steps[current_scene]).instance()
				add_child(scene)
