extends Node

const screen_size = Vector2(1024, 600)

var start_time : int
var last_time : int

const PRINT_TIME_EVERY_MILISECONDS : int = 5000
var time_to_print_next_time : int = PRINT_TIME_EVERY_MILISECONDS

var time_to_show: int = 30 * 1000 # How long test works in miliseconds

var time_for_each_step : int = -1 

# Each scene runs alone
const alone_steps : Array = [
	"res://MainScenes/Control.tscn",
	"res://MainScenes/Node2D.tscn",
	"res://MainScenes/Other.tscn",
	"res://MainScenes/Spatial.tscn",
	"res://Physics/2D/Physics2D.tscn",
	"res://Physics/3D/Physics3D.tscn",
	"res://Rendering/Lights2D/Lights2D.tscn",
	"res://Rendering/Lights3D/Lights3D.tscn",
	"res://Text/Text.tscn"
]

# All scenes run in one step
# This should be put regression scripts which needs to run only once
const all_in_one : Array = [
"res://AIO/Operators/Operators.tscn",
]

func _init(): 
	start_time = OS.get_system_time_msecs()
	
	# In case when user doesn't provide time
	time_for_each_step = time_to_show / (alone_steps.size() + 1)
	
	for argument in OS.get_cmdline_args():
		var rr: String = argument
		if rr.ends_with("tscn"):  # Ignore all tscn scenes/names
			continue
		time_to_show = int(argument.to_float() * 1000)
		time_for_each_step = time_to_show / (alone_steps.size() + 1)
		print("Time set to: " + str(time_to_show / 1000.0) + " seconds with "+ str(alone_steps.size() + 1) + " steps, each step will take " + str(time_for_each_step / 1000.0) + " seconds.")


func _process(delta: float) -> void:
	var current_run_time : int = OS.get_system_time_msecs() - start_time
	
	if current_run_time > time_to_print_next_time:
		print("Test is running now " + str(int(time_to_print_next_time / 1000)) + " seconds")
		time_to_print_next_time += PRINT_TIME_EVERY_MILISECONDS
		
	if current_run_time > time_to_show:
		print("Ending test")
		get_tree().quit()
