extends Node

const RANGE : int = 5

var time_to_show : float = -1000.0

func _init() -> void:
	for argument in OS.get_cmdline_args():
		var rr : String = argument
		if rr.find("tscn") != -1: # Ignore all tscn scenes/names
			continue
		time_to_show = argument.to_float()
		print("Time set to: " + str(time_to_show))
		break

func _process(delta : float) -> void:
	time_to_show -= delta
	if time_to_show < 0 && time_to_show > -500:
		get_tree().quit()
