extends Node

const screen_size = Vector2(1024, 600)

const RANGE: int = 10

const PRINT_TIME_EVERY_SECONDS : int = 5
var time_to_print_next_time : int = PRINT_TIME_EVERY_SECONDS
var current_run_time : float = 0.0

var time_to_show: float = 30 # How long test works

var time_for_each_step : float = -1.0

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
	# In case when user doesn't provide time
	time_for_each_step = time_to_show / (alone_steps.size() + 1)
	
	for argument in OS.get_cmdline_args():
		var rr: String = argument
		if rr.find("tscn") != -1:  # Ignore all tscn scenes/names
			continue
		time_to_show = argument.to_float()
		time_for_each_step = time_to_show / (alone_steps.size() + 1)
		print("Time set to: " + str(time_to_show) + " seconds with "+ str(alone_steps.size() + 1) + " steps, each step will take " + str(time_for_each_step) + " seconds.")
		break


func _process(delta: float) -> void:
	current_run_time += delta
	if current_run_time > time_to_print_next_time:
		print("Test is running now " + str(time_to_print_next_time) + " seconds")
		time_to_print_next_time += PRINT_TIME_EVERY_SECONDS
		
	if current_run_time > time_to_show:
		get_tree().quit()
