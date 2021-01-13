extends Control

var current_scene : int = -1
var time_to_switch : int
const NUMBER_OF_INSTANCES : int = 1 # Use more than 1 to stress test, 1 should be optimal for casual CI

var array_with_time_to_change : Array = []

func _ready():
	for i in Autoload.alone_steps.size() + 1:
		array_with_time_to_change.append(OS.get_ticks_msec() + (i + 1) * Autoload.time_for_each_step)
	
	print("Starting with scene(s):")
	for path in  Autoload.all_in_one:
		for _i in range(NUMBER_OF_INSTANCES):
			var scene : Node = load(path).instance()
			add_child(scene)
		print("   - " + path)
	

func _process(_delta):
	if current_scene < Autoload.alone_steps.size() - 1 && OS.get_ticks_msec() > array_with_time_to_change[current_scene + 1]:
		current_scene += 1
			
		for child in get_children():
			child.queue_free()
		
		print("Changed scene to " + Autoload.alone_steps[current_scene])
		
		for _i in range(NUMBER_OF_INSTANCES):
			var scene : Node = load(Autoload.alone_steps[current_scene]).instance()
			add_child(scene)
