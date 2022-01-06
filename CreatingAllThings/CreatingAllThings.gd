extends Node2D

var available_classes: Array = []
var exeptions: Array = ["SceneTree", "EditorSettings", "ProjectSettings", "InputEventShortcut", "InputMap"]


func _ready():
	var cl: Array = Array(ClassDB.get_class_list())
	cl.sort()
	for name_of_class in cl:
		# Repeat 3 times, to be sure that code don't crash in unreleated function
		for _i in range(3):
			if !ClassDB.can_instantiate(name_of_class):
				continue
			if name_of_class in exeptions:
				continue
			if name_of_class.to_lower().find("server") != -1:
				continue

			print("########### " + name_of_class)
			print('GDSCRIPT CODE:  var thing = ClassDB.instantiate("' + name_of_class + '")')
			print("GDSCRIPT CODE:  str(" + name_of_class + ")")

			var thing = ClassDB.instantiate(name_of_class)
			str(thing)

			if thing is Node:
				print("GDSCRIPT CODE:  thing.queue_free()")
				thing.queue_free()
			elif thing is Object && !(thing is RefCounted):
				print("GDSCRIPT CODE:  thing.free()")
				thing.free()
