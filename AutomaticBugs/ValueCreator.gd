extends Node

# Creates random or not objects, variables etc.

var number: float = 0.0
var max_array_size: int = 15


func _ready() -> void:
	randomize()


func get_int() -> int:
	return int(number)


func get_int_string() -> String:
	return str(int(number))


func get_float() -> float:
	return number


func get_float_string() -> String:
	return str(number)


func get_bool() -> bool:
	return bool()


func get_bool_string() -> String:
	return str(bool())


func get_vector2() -> Vector2:
	return Vector2(get_float(), get_float())


func get_vector2i() -> Vector2i:
	return Vector2i(get_int(), get_int())


func get_vector3() -> Vector3:
	return Vector3(get_float(), get_float(), get_float())


func get_vector3i() -> Vector3i:
	return Vector3i(get_int(), get_int(), get_int())

func get_vector4() -> Vector4:
	return Vector4(get_float(), get_float(), get_float(), get_float())


func get_vector4i() -> Vector4i:
	return Vector4i(get_int(), get_int(), get_int(), get_int())
	
func get_projection() -> Projection:
	return Projection(get_vector4(),get_vector4(),get_vector4(),get_vector4())

func get_aabb() -> AABB:
	return AABB(get_vector3(), get_vector3())


func get_transform3D() -> Transform3D:
	return Transform3D(get_vector3(), get_vector3(), get_vector3(), get_vector3())


func get_transform2D() -> Transform2D:
	return Transform2D(get_vector2(), get_vector2(), get_vector2())


func get_plane() -> Plane:
	return Plane(get_vector3(), get_vector3(), get_vector3())


func get_quaternion() -> Quaternion:
	return Quaternion(get_vector3(),get_float())


func get_basis() -> Basis:
	return Basis(get_vector3(), get_vector3(), get_vector3())


func get_rect2() -> Rect2:
	return Rect2(get_vector2(), get_vector2())


func get_rect2i() -> Rect2i:
	return Rect2i(get_vector2i(), get_vector2i())


func get_color() -> Color:
	return Color(get_float(), get_float(), get_float())


func get_string() -> String:
	return String()


func get_nodepath() -> NodePath:
	return NodePath(get_string())


func get_dictionary() -> Dictionary:
	return Dictionary({})


func get_array() -> Array:
	var array: Array = []
	for _i in range(int(min(max_array_size, number))):
		array.append([])
	return Array([])


func get_Packed_string_array() -> PackedStringArray:
	var array: Array = []
	for _i in range(int(min(max_array_size, number))):
		array.append(get_string())
	return PackedStringArray(array)


func get_Packed_int32_array() -> PackedInt32Array:
	var array: Array = []
	for _i in range(int(min(max_array_size, number))):
		array.append(get_int())
	return PackedInt32Array(array)


func get_Packed_int64_array() -> PackedInt32Array:
	var array: Array = []
	for _i in range(int(min(max_array_size, number))):
		array.append(get_int())
	return PackedInt32Array(array)


func get_Packed_byte_array() -> PackedByteArray:
	var array: Array = []
	for _i in range(int(min(max_array_size, number))):
		array.append(get_int())
	return PackedByteArray(array)


func get_Packed_float32_array() -> PackedFloat32Array:
	var array: Array = []
	for _i in range(int(min(max_array_size, number))):
		array.append(get_float())
	return PackedFloat32Array(array)


func get_Packed_float64_array() -> PackedFloat64Array:
	var array: Array = []
	for _i in range(int(min(max_array_size, number))):
		array.append(get_float())
	return PackedFloat64Array(array)


func get_Packed_vector2_array() -> PackedVector2Array:
	var array: Array = []
	for _i in range(int(min(max_array_size, number))):
		array.append(get_vector2())
	return PackedVector2Array(array)


func get_Packed_vector3_array() -> PackedVector3Array:
	var array: Array = []
	for _i in range(int(min(max_array_size, number))):
		array.append(get_vector3())
	return PackedVector3Array(array)


func get_Packed_color_array() -> PackedColorArray:
	var array: Array = []
	for _i in range(int(min(max_array_size, number))):
		array.append(get_color())
	return PackedColorArray(array)


func get_object(object_name: String) -> Object:
	assert(ClassDB.class_exists(object_name))  #,"Class " + object_name + " doesn't exists.")
#	if object_name == "PhysicsDirectSpaceState3D" || object_name == "PhysicsDirectSpaceState2D":
#		return BoxShape3D.new()

	var a = 0
	if ClassDB.can_instantiate(object_name):  # E.g. Texture2D is not instantable or shouldn't be, but ImageTexture is
		return ClassDB.instantiate(object_name)
	else:
		# Checking for children of non instantable object
		var list_of_class = ClassDB.get_inheriters_from_class(object_name)
		assert(list_of_class.size() > 0)  # Number of inherited class of non instantable class must be greater than 0, otherwise this function would be useless#,"Cannot find proper instantable child for " + object_name)
		for i in list_of_class:
			if ClassDB.can_instantiate(i) && (ClassDB.is_parent_class(i, "Node") || ClassDB.is_parent_class(i, "RefCounted")):
				return ClassDB.instantiate(i)
	assert(false)  #,"Cannot find proper instantable child for " + object_name)
	return BoxShape3D.new()
