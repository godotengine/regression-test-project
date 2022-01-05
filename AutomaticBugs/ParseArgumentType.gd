extends Node


func parse_and_return_objects(method_data: Dictionary, name_of_class: String, debug_print: bool = false) -> Array:
	var arguments_array: Array = Array([])

	ValueCreator.number = 100

	for argument in method_data.get("args"):
		var type = argument.get("type")
		if type == TYPE_NIL:  # Looks that this means VARIANT not null
			arguments_array.push_back(false)  # TODO Add some randomization
#				assert(false)
		elif type == TYPE_AABB:
			arguments_array.push_back(ValueCreator.get_aabb())
		elif type == TYPE_ARRAY:
			arguments_array.push_back(ValueCreator.get_array())
		elif type == TYPE_BASIS:
			arguments_array.push_back(ValueCreator.get_basis())
		elif type == TYPE_BOOL:
			arguments_array.push_back(ValueCreator.get_bool())
		elif type == TYPE_COLOR:
			arguments_array.push_back(ValueCreator.get_color())
		elif type == TYPE_COLOR_ARRAY:
			arguments_array.push_back(PackedColorArray([]))
		elif type == TYPE_DICTIONARY:
			arguments_array.push_back(ValueCreator.get_dictionary())
		elif type == TYPE_INT:
			arguments_array.push_back(ValueCreator.get_int())
		elif type == TYPE_INT32_ARRAY:
			arguments_array.push_back(PackedInt32Array([]))
		elif type == TYPE_INT64_ARRAY:
			arguments_array.push_back(PackedInt64Array([]))
		elif type == TYPE_NODE_PATH:
			arguments_array.push_back(ValueCreator.get_nodepath())
		elif type == TYPE_OBJECT:
			arguments_array.push_back(ValueCreator.get_object(argument.get("class_name")))
		elif type == TYPE_PLANE:
			arguments_array.push_back(ValueCreator.get_plane())
		elif type == TYPE_QUATERNION:
			arguments_array.push_back(ValueCreator.get_quaternion())
		elif type == TYPE_RAW_ARRAY:
			arguments_array.push_back(PackedByteArray([]))
		elif type == TYPE_FLOAT:
			arguments_array.push_back(ValueCreator.get_float())
		elif type == TYPE_FLOAT32_ARRAY:
			arguments_array.push_back(PackedFloat32Array([]))
		elif type == TYPE_FLOAT64_ARRAY:
			arguments_array.push_back(PackedFloat64Array([]))
		elif type == TYPE_RECT2:
			arguments_array.push_back(ValueCreator.get_rect2())
		elif type == TYPE_RECT2I:
			arguments_array.push_back(ValueCreator.get_rect2i())
		elif type == TYPE_RID:
			arguments_array.push_back(RID())
		elif type == TYPE_STRING:
			arguments_array.push_back(ValueCreator.get_string())
		elif type == TYPE_STRING_NAME:
			arguments_array.push_back(StringName(ValueCreator.get_string()))
		elif type == TYPE_STRING_ARRAY:
			arguments_array.push_back(PackedStringArray([]))
		elif type == TYPE_TRANSFORM3D:
			arguments_array.push_back(ValueCreator.get_transform3D())
		elif type == TYPE_TRANSFORM2D:
			arguments_array.push_back(ValueCreator.get_transform2D())
		elif type == TYPE_VECTOR2:
			arguments_array.push_back(ValueCreator.get_vector2())
		elif type == TYPE_VECTOR2I:
			arguments_array.push_back(ValueCreator.get_vector2i())
		elif type == TYPE_VECTOR2_ARRAY:
			arguments_array.push_back(PackedVector2Array([]))
		elif type == TYPE_VECTOR3:
			arguments_array.push_back(ValueCreator.get_vector3())
		elif type == TYPE_VECTOR3I:
			arguments_array.push_back(ValueCreator.get_vector3i())
		elif type == TYPE_VECTOR3_ARRAY:
			arguments_array.push_back(PackedVector3Array([]))
		elif type == TYPE_CALLABLE:
			arguments_array.push_back(Callable(BoxMesh.new(), "Rar"))
		else:
			assert(false)  # Missed some types, add it

#	assert(is_instance_valid(arguments_array) == true)
	if debug_print:
		print("\n" + name_of_class + "." + method_data.get("name") + " --- executing with " + str(arguments_array.size()) + " parameters " + str(arguments_array))
	return arguments_array


func return_gdscript_code_which_run_this_object(data) -> String:
	var return_string: String = ""

	var type = typeof(data)

	if type == TYPE_NIL:  # Looks that this means VARIANT not null
		return_string = "null"
		#assert("false", "This is even possible?")
	elif type == TYPE_AABB:
		return_string = "AABB("
		return_string += return_gdscript_code_which_run_this_object(data.position)
		return_string += ", "
		return_string += return_gdscript_code_which_run_this_object(data.size)
		return_string += ")"
	elif type == TYPE_ARRAY:
		return_string = "Array(["
		for i in data.size():
			return_string += return_gdscript_code_which_run_this_object(data[i])
			if i != data.size() - 1:
				return_string += ", "
		return_string += "])"
	elif type == TYPE_BASIS:
		return_string = "Basis("
		return_string += return_gdscript_code_which_run_this_object(data.x)
		return_string += ", "
		return_string += return_gdscript_code_which_run_this_object(data.y)
		return_string += ", "
		return_string += return_gdscript_code_which_run_this_object(data.z)
		return_string += ")"
	elif type == TYPE_BOOL:
		if data == true:
			return_string = "true"
		else:
			return_string = "false"
	elif type == TYPE_COLOR:
		return_string = "Color("
		return_string += return_gdscript_code_which_run_this_object(data.r)
		return_string += ", "
		return_string += return_gdscript_code_which_run_this_object(data.g)
		return_string += ", "
		return_string += return_gdscript_code_which_run_this_object(data.b)
		return_string += ", "
		return_string += return_gdscript_code_which_run_this_object(data.a)
		return_string += ")"
	elif type == TYPE_COLOR_ARRAY:
		return_string = "PoolColorArray(["
		for i in data.size():
			return_string += return_gdscript_code_which_run_this_object(data[i])
			if i != data.size() - 1:
				return_string += ", "
		return_string += "])"
	elif type == TYPE_DICTIONARY:
		return_string = "{"
		for i in data.size():
			return_string += return_gdscript_code_which_run_this_object(data.keys()[i])
			return_string += " : "
			return_string += return_gdscript_code_which_run_this_object(data.values()[i])
			if i != data.size() - 1:
				return_string += ", "
		return_string += "}"
	elif type == TYPE_INT:
		return_string = str(data)
	elif type == TYPE_INT32_ARRAY:
		return_string = "PoolInt32Array(["
		for i in data.size():
			return_string += return_gdscript_code_which_run_this_object(data[i])
			if i != data.size() - 1:
				return_string += ", "
		return_string += "])"
	elif type == TYPE_INT64_ARRAY:
		return_string = "PoolInt64Array(["
		for i in data.size():
			return_string += return_gdscript_code_which_run_this_object(data[i])
			if i != data.size() - 1:
				return_string += ", "
		return_string += "])"
	elif type == TYPE_NODE_PATH:
		return_string = "NodePath("
		return_string += return_gdscript_code_which_run_this_object(str(data))
		return_string += ")"
	elif type == TYPE_OBJECT:
		if data == null:
			return_string = "null"
		else:
			var name_of_class: String = data.get_class()
			if (
				ClassDB.is_parent_class(name_of_class, "Object")
				&& !ClassDB.is_parent_class(name_of_class, "Node")
				&& !ClassDB.is_parent_class(name_of_class, "RefCounted")
				&& !ClassDB.class_has_method(name_of_class, "new")
			):
				return_string += 'ClassDB.instance("' + name_of_class + '")'
			else:
				return_string = name_of_class.trim_prefix("_")
				return_string += ".new()"

	elif type == TYPE_PLANE:
		return_string = "Plane("
		return_string += return_gdscript_code_which_run_this_object(data.x)
		return_string += ", "
		return_string += return_gdscript_code_which_run_this_object(data.y)
		return_string += ", "
		return_string += return_gdscript_code_which_run_this_object(data.z)
		return_string += ", "
		return_string += return_gdscript_code_which_run_this_object(data.d)
		return_string += ")"
	elif type == TYPE_QUATERNION:
		return_string = "Quaternion("
		return_string += return_gdscript_code_which_run_this_object(data.x)
		return_string += ", "
		return_string += return_gdscript_code_which_run_this_object(data.y)
		return_string += ", "
		return_string += return_gdscript_code_which_run_this_object(data.z)
		return_string += ", "
		return_string += return_gdscript_code_which_run_this_object(data.w)
		return_string += ")"
	elif type == TYPE_RAW_ARRAY:
		return_string = "PoolByteArray(["
		for i in data.size():
			return_string += return_gdscript_code_which_run_this_object(data[i])
			if i != data.size() - 1:
				return_string += ", "
		return_string += "])"
	elif type == TYPE_FLOAT:
		return_string = str(data)
	elif type == TYPE_FLOAT32_ARRAY:
		return_string = "PoolFloat32Array(["
		for i in data.size():
			return_string += return_gdscript_code_which_run_this_object(data[i])
			if i != data.size() - 1:
				return_string += ", "
		return_string += "])"
	elif type == TYPE_FLOAT64_ARRAY:
		return_string = "PoolFloat64Array(["
		for i in data.size():
			return_string += return_gdscript_code_which_run_this_object(data[i])
			if i != data.size() - 1:
				return_string += ", "
		return_string += "])"
	elif type == TYPE_RECT2:
		return_string = "Rect2("
		return_string += return_gdscript_code_which_run_this_object(data.position)
		return_string += ", "
		return_string += return_gdscript_code_which_run_this_object(data.size)
		return_string += ")"
	elif type == TYPE_RECT2I:
		return_string = "Rect2i("
		return_string += return_gdscript_code_which_run_this_object(data.position)
		return_string += ", "
		return_string += return_gdscript_code_which_run_this_object(data.size)
		return_string += ")"
	elif type == TYPE_RID:
		return_string = "RID()"
	elif type == TYPE_STRING:
		return_string = '"' + data + '"'
	elif type == TYPE_STRING_ARRAY:
		return_string = "PackedStringArray(["
		for i in data.size():
			return_string += return_gdscript_code_which_run_this_object(data[i])
			if i != data.size() - 1:
				return_string += ", "
		return_string += "])"
	elif type == TYPE_TRANSFORM3D:
		return_string = "Transform3D("
		return_string += return_gdscript_code_which_run_this_object(data.basis)
		return_string += ", "
		return_string += return_gdscript_code_which_run_this_object(data.origin)
		return_string += ")"
	elif type == TYPE_TRANSFORM2D:
		return_string = "Transform2D("
		return_string += return_gdscript_code_which_run_this_object(data.x)
		return_string += ", "
		return_string += return_gdscript_code_which_run_this_object(data.y)
		return_string += ", "
		return_string += return_gdscript_code_which_run_this_object(data.origin)
		return_string += ")"
	elif type == TYPE_VECTOR2:
		return_string = "Vector2("
		return_string += return_gdscript_code_which_run_this_object(data.x)
		return_string += ", "
		return_string += return_gdscript_code_which_run_this_object(data.y)
		return_string += ")"
	elif type == TYPE_VECTOR2I:
		return_string = "Vector2i("
		return_string += return_gdscript_code_which_run_this_object(data.x)
		return_string += ", "
		return_string += return_gdscript_code_which_run_this_object(data.y)
		return_string += ")"
	elif type == TYPE_VECTOR2_ARRAY:
		return_string = "PoolVector2Array(["
		for i in data.size():
			return_string += return_gdscript_code_which_run_this_object(data[i])
			if i != data.size() - 1:
				return_string += ", "
		return_string += "])"
	elif type == TYPE_VECTOR3:
		return_string = "Vector3("
		return_string += return_gdscript_code_which_run_this_object(data.x)
		return_string += ", "
		return_string += return_gdscript_code_which_run_this_object(data.y)
		return_string += ", "
		return_string += return_gdscript_code_which_run_this_object(data.z)
		return_string += ")"
	elif type == TYPE_VECTOR3I:
		return_string = "Vector3i("
		return_string += return_gdscript_code_which_run_this_object(data.x)
		return_string += ", "
		return_string += return_gdscript_code_which_run_this_object(data.y)
		return_string += ", "
		return_string += return_gdscript_code_which_run_this_object(data.z)
		return_string += ")"
	elif type == TYPE_STRING_NAME:
		return_string = "StringName("
		return_string += return_gdscript_code_which_run_this_object(str(data))
		return_string += ")"
	elif type == TYPE_VECTOR3_ARRAY:
		return_string = "PoolVector3Array(["
		for i in data.size():
			return_string += return_gdscript_code_which_run_this_object(data[i])
			if i != data.size() - 1:
				return_string += ", "
		return_string += "])"
	elif type == TYPE_CALLABLE:
		return_string = 'Callable(BoxMesh.new(),"")'
	else:
		print(type)
		assert(false, "Missing type, needs to be added to project")

	return return_string
