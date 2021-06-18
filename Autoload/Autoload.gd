extends Node

const screen_size = Vector2(1024, 600)

var start_time : int
var last_time : int

const PRINT_TIME_EVERY_MILISECONDS : int = 5000
var time_to_print_next_time : int = PRINT_TIME_EVERY_MILISECONDS

var time_to_show: int = 25 * 1000 # How long test works in miliseconds

var time_for_each_step : int = -1 

var os

# Each scene runs alone
const alone_steps : Array = [
	"res://Nodes/Nodes.tscn",
#	"res://ReparentingDeleting/ReparentingDeleting.tscn", # Really slow in 4.0
#	"res://Physics/2D/Physics2D.tscn", # Too slow still
	"res://AutomaticBugs/FunctionExecutor.tscn", # Only Needs to be executed once, but this is workaround a little
#	"res://Physics/3D/Physics3D.tscn", # Loads very long but isn't necessarry so we skip it now
]

func _init(): 
	if ClassDB.class_exists("_OS"):
		os = get_instance_from_name("_OS")
	else:
		os = get_instance_from_name("_Platform")
		
	start_time = Time.get_ticks_msec()
	
	# In case when user doesn't provide time
	time_for_each_step = time_to_show / (alone_steps.size())
	
	for argument in os.get_cmdline_args():
		if argument.is_valid_float(): # Ignore all non numeric arguments 
			time_to_show = int(argument.to_float() * 1000)
			time_for_each_step = time_to_show / (alone_steps.size())
			print("Time set to: " + str(time_to_show / 1000.0) + " seconds with "+ str(alone_steps.size()) + " steps, each step will take " + str(time_for_each_step / 1000.0) + " seconds.")
			break # We only need to take first argument


func _process(delta: float) -> void:
	var current_run_time : int = Time.get_ticks_msec() - start_time
	
	# While loop instead if, will allow to properly flush results under heavy operations(e.g. Thread sanitizer)
	while current_run_time > time_to_print_next_time: 
		print("Test is running now " + str(int(time_to_print_next_time / 1000)) + " seconds")
		time_to_print_next_time += PRINT_TIME_EVERY_MILISECONDS
		
	if current_run_time > time_to_show:
		print("######################## Ending test ########################")
		get_tree().quit()

func get_instance_from_name(method: String):
	if ClassDB.class_has_method("_ClassDB","instance"):
		return ClassDB.call("instance",method)
	else:
		return ClassDB.call("instantiate",method)
	

func _exit_tree():
	os.free()
