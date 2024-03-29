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


func get_vector3() -> Vector3:
	return Vector3(get_float(), get_float(), get_float())


func get_aabb() -> AABB:
	return AABB(get_vector3(), get_vector3())


func get_transform() -> Transform:
	return Transform(get_vector3(), get_vector3(), get_vector3(), get_vector3())


func get_transform2D() -> Transform2D:
	return Transform2D(get_vector2(), get_vector2(), get_vector2())


func get_plane() -> Plane:
	return Plane(get_vector3(), get_vector3(), get_vector3())


func get_quat() -> Quat:
	return Quat(get_vector3())


func get_basis() -> Basis:
	return Basis(get_vector3())


func get_rect2() -> Rect2:
	return Rect2(get_vector2(), get_vector2())


func get_color() -> Color:
	return Color(get_float(), get_float(), get_float())


func get_string() -> String:
	return String()


func get_nodepath() -> NodePath:
	return NodePath(get_string())


func get_array() -> Array:
	return Array([])


func get_dictionary() -> Dictionary:
	return Dictionary({})


func get_pool_string_array() -> PoolStringArray:
	var array: Array = []
	for _i in range(int(min(max_array_size, number))):
		array.append(get_string())
	return PoolStringArray(array)


func get_pool_int_array() -> PoolIntArray:
	var array: Array = []
	for _i in range(int(min(max_array_size, number))):
		array.append(get_int())
	return PoolIntArray(array)


func get_pool_byte_array() -> PoolByteArray:
	var array: Array = []
	for _i in range(int(min(max_array_size, number))):
		array.append(get_int())
	return PoolByteArray(array)


func get_pool_real_array() -> PoolRealArray:
	var array: Array = []
	for _i in range(int(min(max_array_size, number))):
		array.append(get_float())
	return PoolRealArray(array)


func get_pool_vector2_array() -> PoolVector2Array:
	var array: Array = []
	for _i in range(int(min(max_array_size, number))):
		array.append(get_vector2())
	return PoolVector2Array(array)


func get_pool_vector3_array() -> PoolVector3Array:
	var array: Array = []
	for _i in range(int(min(max_array_size, number))):
		array.append(get_vector3())
	return PoolVector3Array(array)


func get_pool_color_array() -> PoolColorArray:
	var array: Array = []
	for _i in range(int(min(max_array_size, number))):
		array.append(get_color())
	return PoolColorArray(array)


func get_object(object_name: String) -> Object:
	assert(ClassDB.class_exists(object_name), "Class " + object_name + " doesn't exists.")
#	if object_name == "PhysicsDirectSpaceState" || object_name == "Physics2DDirectSpaceState":
#		return BoxShape.new()

	var a = 0
	if ClassDB.can_instance(object_name):  # E.g. Texture is not instantable or shouldn't be, but LargeTexture is
		return ClassDB.instance(object_name)
	else:
		# Checking for children of non instantable object
		var list_of_class = ClassDB.get_inheriters_from_class(object_name)
		assert(list_of_class.size() > 0, "Cannot find proper instantable child for " + object_name)  # Number of inherited class of non instantable class must be greater than 0, otherwise this function would be useless
		for i in list_of_class:
			if ClassDB.can_instance(i) && (ClassDB.is_parent_class(i, "Node") || ClassDB.is_parent_class(i, "Reference")):
				return ClassDB.instance(i)
	assert(false, "Cannot find proper instantable child for " + object_name)
	return BoxShape.new()
