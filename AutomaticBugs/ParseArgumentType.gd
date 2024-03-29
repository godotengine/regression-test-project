extends Node


func parse_and_return_objects(method_data: Dictionary, name_of_class: String, debug_print: bool = false) -> Array:
	var arguments_array: Array = []

	for argument in method_data["args"]:
		match argument.type:
			TYPE_NIL:  # Looks that this means VARIANT not null
				arguments_array.push_back(false)
			TYPE_AABB:
				arguments_array.push_back(ValueCreator.get_aabb())
			TYPE_ARRAY:
				arguments_array.push_back(ValueCreator.get_array())
			TYPE_BASIS:
				arguments_array.push_back(ValueCreator.get_basis())
			TYPE_BOOL:
				arguments_array.push_back(ValueCreator.get_bool())
			TYPE_COLOR:
				arguments_array.push_back(ValueCreator.get_color())
			TYPE_COLOR_ARRAY:
				arguments_array.push_back(ValueCreator.get_pool_color_array())
			TYPE_DICTIONARY:
				arguments_array.push_back(ValueCreator.get_dictionary())
			TYPE_INT:
				arguments_array.push_back(ValueCreator.get_int())
			TYPE_INT_ARRAY:
				arguments_array.push_back(ValueCreator.get_pool_int_array())
			TYPE_NODE_PATH:
				arguments_array.push_back(ValueCreator.get_nodepath())
			TYPE_OBJECT:
				var obj: Object = ValueCreator.get_object(argument["class_name"])
				arguments_array.push_back(obj)
				assert(obj != null, "Failed to create an object of type " + argument["class_name"])
			TYPE_PLANE:
				arguments_array.push_back(ValueCreator.get_plane())
			TYPE_QUAT:
				arguments_array.push_back(ValueCreator.get_quat())
			TYPE_RAW_ARRAY:
				arguments_array.push_back(ValueCreator.get_pool_byte_array())
			TYPE_REAL:
				arguments_array.push_back(ValueCreator.get_float())
			TYPE_REAL_ARRAY:
				arguments_array.push_back(ValueCreator.get_pool_real_array())
			TYPE_RECT2:
				arguments_array.push_back(ValueCreator.get_rect2())
			TYPE_RID:
				arguments_array.push_back(RID())
			TYPE_STRING:
				arguments_array.push_back(ValueCreator.get_string())
			TYPE_STRING_ARRAY:
				arguments_array.push_back(ValueCreator.get_pool_string_array())
			TYPE_TRANSFORM:
				arguments_array.push_back(ValueCreator.get_transform())
			TYPE_TRANSFORM2D:
				arguments_array.push_back(ValueCreator.get_transform2D())
			TYPE_VECTOR2:
				arguments_array.push_back(ValueCreator.get_vector2())
			TYPE_VECTOR2_ARRAY:
				arguments_array.push_back(ValueCreator.get_pool_vector2_array())
			TYPE_VECTOR3:
				arguments_array.push_back(ValueCreator.get_vector3())
			TYPE_VECTOR3_ARRAY:
				arguments_array.push_back(ValueCreator.get_pool_vector3_array())
			_:
				assert(false, "Missing type, needs to be added to project")

	if debug_print:
		print("\n" + name_of_class + "." + method_data["name"] + " --- executing with " + str(arguments_array.size()) + " parameters " + str(arguments_array))
	return arguments_array


func return_gdscript_code_which_run_this_object(data) -> String:
	if data == null:
		return "null"

	var return_string: String = ""

	match typeof(data):
		TYPE_NIL:  # Looks that this means VARIANT not null
			assert("false", "This is even possible?")
		TYPE_AABB:
			return_string = "AABB("
			return_string += return_gdscript_code_which_run_this_object(data.position)
			return_string += ", "
			return_string += return_gdscript_code_which_run_this_object(data.size)
			return_string += ")"
		TYPE_ARRAY:
			return_string = "Array(["
			for i in data.size():
				return_string += return_gdscript_code_which_run_this_object(data[i])
				if i != data.size() - 1:
					return_string += ", "
			return_string += "])"
		TYPE_BASIS:
			return_string = "Basis("
			return_string += return_gdscript_code_which_run_this_object(data.x)
			return_string += ", "
			return_string += return_gdscript_code_which_run_this_object(data.y)
			return_string += ", "
			return_string += return_gdscript_code_which_run_this_object(data.z)
			return_string += ")"
		TYPE_BOOL:
			if data == true:
				return_string = "true"
			else:
				return_string = "false"
		TYPE_COLOR:
			return_string = "Color("
			return_string += return_gdscript_code_which_run_this_object(data.r)
			return_string += ", "
			return_string += return_gdscript_code_which_run_this_object(data.g)
			return_string += ", "
			return_string += return_gdscript_code_which_run_this_object(data.b)
			return_string += ", "
			return_string += return_gdscript_code_which_run_this_object(data.a)
			return_string += ")"
		TYPE_COLOR_ARRAY:
			return_string = "PoolColorArray(["
			for i in data.size():
				return_string += return_gdscript_code_which_run_this_object(data[i])
				if i != data.size() - 1:
					return_string += ", "
			return_string += "])"
		TYPE_DICTIONARY:
			return_string = "{"
			for i in data.size():
				return_string += return_gdscript_code_which_run_this_object(data.keys()[i])
				return_string += " : "
				return_string += return_gdscript_code_which_run_this_object(data.values()[i])
				if i != data.size() - 1:
					return_string += ", "
			return_string += "}"
		TYPE_INT:
			return_string = str(data)
		TYPE_INT_ARRAY:
			return_string = "PoolIntArray(["
			for i in data.size():
				return_string += return_gdscript_code_which_run_this_object(data[i])
				if i != data.size() - 1:
					return_string += ", "
			return_string += "])"
		TYPE_NODE_PATH:
			return_string = "NodePath("
			return_string += return_gdscript_code_which_run_this_object(str(data))
			return_string += ")"
		TYPE_OBJECT:
			if data == null:
				return_string = "null"
			else:
				var name_of_class: String = data.get_class()
				if (
					ClassDB.is_parent_class(name_of_class, "Object")
					&& !ClassDB.is_parent_class(name_of_class, "Node")
					&& !ClassDB.is_parent_class(name_of_class, "Reference")
					&& !ClassDB.class_has_method(name_of_class, "new")
				):
					return_string += 'ClassDB.instance("' + name_of_class + '")'
				else:
					return_string = name_of_class.trim_prefix("_")
					return_string += ".new()"

		TYPE_PLANE:
			return_string = "Plane("
			return_string += return_gdscript_code_which_run_this_object(data.x)
			return_string += ", "
			return_string += return_gdscript_code_which_run_this_object(data.y)
			return_string += ", "
			return_string += return_gdscript_code_which_run_this_object(data.z)
			return_string += ", "
			return_string += return_gdscript_code_which_run_this_object(data.d)
			return_string += ")"
		TYPE_QUAT:
			return_string = "Quat("
			return_string += return_gdscript_code_which_run_this_object(data.x)
			return_string += ", "
			return_string += return_gdscript_code_which_run_this_object(data.y)
			return_string += ", "
			return_string += return_gdscript_code_which_run_this_object(data.z)
			return_string += ", "
			return_string += return_gdscript_code_which_run_this_object(data.w)
			return_string += ")"
		TYPE_RAW_ARRAY:
			return_string = "PoolByteArray(["
			for i in data.size():
				return_string += return_gdscript_code_which_run_this_object(data[i])
				if i != data.size() - 1:
					return_string += ", "
			return_string += "])"
		TYPE_REAL:
			return_string = str(data)
		TYPE_REAL_ARRAY:
			return_string = "PoolRealArray(["
			for i in data.size():
				return_string += return_gdscript_code_which_run_this_object(data[i])
				if i != data.size() - 1:
					return_string += ", "
			return_string += "])"
		TYPE_RECT2:
			return_string = "Rect2("
			return_string += return_gdscript_code_which_run_this_object(data.position)
			return_string += ", "
			return_string += return_gdscript_code_which_run_this_object(data.size)
			return_string += ")"
		TYPE_RID:
			return_string = "RID()"
		TYPE_STRING:
			return_string = '"' + data + '"'
		TYPE_STRING_ARRAY:
			return_string = "PoolStringArray(["
			for i in data.size():
				return_string += return_gdscript_code_which_run_this_object(data[i])
				if i != data.size() - 1:
					return_string += ", "
			return_string += "])"
		TYPE_TRANSFORM:
			return_string = "Transform("
			return_string += return_gdscript_code_which_run_this_object(data.basis)
			return_string += ", "
			return_string += return_gdscript_code_which_run_this_object(data.origin)
			return_string += ")"
		TYPE_TRANSFORM2D:
			return_string = "Transform2D("
			return_string += return_gdscript_code_which_run_this_object(data.x)
			return_string += ", "
			return_string += return_gdscript_code_which_run_this_object(data.y)
			return_string += ", "
			return_string += return_gdscript_code_which_run_this_object(data.origin)
			return_string += ")"
		TYPE_VECTOR2:
			return_string = "Vector2("
			return_string += return_gdscript_code_which_run_this_object(data.x)
			return_string += ", "
			return_string += return_gdscript_code_which_run_this_object(data.y)
			return_string += ")"
		TYPE_VECTOR2_ARRAY:
			return_string = "PoolVector2Array(["
			for i in data.size():
				return_string += return_gdscript_code_which_run_this_object(data[i])
				if i != data.size() - 1:
					return_string += ", "
			return_string += "])"
		TYPE_VECTOR3:
			return_string = "Vector3("
			return_string += return_gdscript_code_which_run_this_object(data.x)
			return_string += ", "
			return_string += return_gdscript_code_which_run_this_object(data.y)
			return_string += ", "
			return_string += return_gdscript_code_which_run_this_object(data.z)
			return_string += ")"
		TYPE_VECTOR3_ARRAY:
			return_string = "PoolVector3Array(["
			for i in data.size():
				return_string += return_gdscript_code_which_run_this_object(data[i])
				if i != data.size() - 1:
					return_string += ", "
			return_string += "])"
		_:
			assert(false, "Missing type, needs to be added to project")

	return return_string
