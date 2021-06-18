extends Node

var TIME_TO_DELETE : float = 100.0
var time_to_delete : float = TIME_TO_DELETE
	
var disabled_classes : Array = ["NavigationAgent2D", "NavigationAgent3D","GPUParticlesCollisionHeightField",

	# Creating them is really slow in Godot 4.0
	"ColorPicker",
	"FileDialog",
	"ColorPickerButton",
	"PhysicalSkyMaterial",
	"ProceduralSkyMaterial"]
	
func _populate() -> void:
	for _i in range(1): # Number of created 
		for name_of_class in ClassDB.get_class_list():
			if name_of_class in disabled_classes:
				continue
			if !ClassDB.can_instance(name_of_class):
				continue
				
				
			if ClassDB.is_parent_class(name_of_class,"Control"):
				add_child(Autoload.get_instance_from_name(name_of_class))
				continue
			if ClassDB.is_parent_class(name_of_class,"Node3D"):
				add_child(Autoload.get_instance_from_name(name_of_class))
				continue
			if ClassDB.is_parent_class(name_of_class,"Node2D"):
				add_child(Autoload.get_instance_from_name(name_of_class))
				continue
			if ClassDB.is_parent_class(name_of_class,"Node"):
				add_child(Autoload.get_instance_from_name(name_of_class))
				continue
				
				
# Populate at start
func _ready() -> void: 
	_populate()

# Move nodes a little and delete and readd them later
func _process(delta: float) -> void:
#	for i in get_children():
#		if i is Control:
#			i._set_size(Vector2(200 * randf() - 100, 200 * randf() - 100))
#		if i is Node2D:
#			i.set_position(Vector2(1000 * randf() - 500, 1000 * randf() - 500))
#		if i is Node3D:
#			if i.get_name() != "Camera":
#				i.set_scale(Vector3(delta + 1, delta + 1, delta + 1))
#				i.set_translation(Vector3(10 * randf(), 10 * randf(), 10 * randf()))
			
	time_to_delete -= delta
	if time_to_delete < 0:
		time_to_delete += TIME_TO_DELETE
		
		for i in get_children():
			i.queue_free()
			
		_populate()
