extends Node2D

var available_classes: Array = []
var exceptions: Array = []


func _ready():
	var classes_to_check = BasicData.get_list_of_available_classes()

	for name_of_class in classes_to_check:
		# Repeat 3 times, to be sure that code don't crash in unreleated function
		for _i in range(3):
			print("########### " + name_of_class)
			print('GDSCRIPT CODE:  var thing = ClassDB.instantiate("' + name_of_class + '")')
			var thing = ClassDB.instantiate(name_of_class)

			# Sometimes even printing cause crash
			print("GDSCRIPT CODE:  str(" + name_of_class + ")")
			str(thing)

			if thing is Node:
				print("GDSCRIPT CODE:  thing.queue_free()")
				thing.queue_free()
			elif thing is Object && !(thing is RefCounted):
				print("GDSCRIPT CODE:  thing.free()")
				thing.free()
