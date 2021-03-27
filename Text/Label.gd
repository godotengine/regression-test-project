extends Label

const TIME : float = 0.1
var time_to_stop : float = TIME
var current_type : int = 0

func _process(delta: float) -> void:
	time_to_stop -= delta
	if time_to_stop < 0:
		time_to_stop = TIME
		
		current_type += 1
		current_type %= 2
		
	if current_type == 0:
		set_text("ŚWIERSZCZ NAD GŻEGŻÓŁKĄ W ŻÓŁCI")
	else:
		text += "AQWAMARYNA"
