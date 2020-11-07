extends Node2D

#var all_types: Array = [
#	AABB(),
#	Array(),
#	Basis(),
#	Color(),
#	Dictionary(),
#	NodePath(),
#	Plane(),
#	PoolByteArray(),
#	PoolColorArray(),
#	PoolIntArray(),
#	PoolRealArray(),
#	PoolStringArray(),
#	PoolVector2Array(),
#	PoolVector3Array(),
#	Quat(),
#	Rect2(),
#	String(),
#	Transform(),
#	Transform2D(),
#	Vector2(),
#	Vector3(),
#	float(),
#	int(),
#	bool()
#]


func _ready() -> void:
#	for i in []

	for i in [
		Color(),
		Plane(),
		Quat(),
		Vector2(),
		Vector3(),
		float(),
		int(),
	]:
		i = -i
	for i in [
	AABB(),
	Array(),
	Basis(),
	Color(),
	Dictionary(),
	NodePath(),
	Plane(),
	PoolByteArray(),
	PoolColorArray(),
	PoolIntArray(),
	PoolRealArray(),
	PoolStringArray(),
	PoolVector2Array(),
	PoolVector3Array(),
	Quat(),
	Rect2(),
	String(),
	Transform(),
	Transform2D(),
	Vector2(),
	Vector3(),
	float(),
	int(),
	bool()
]:
		i = i
	for i in [
	Plane(),
	Quat(),
	Vector2(),
	Vector3(),
	float(),
	int(),
]:
		i = +i
	for i in [
	Color(),
	Vector2(),
	Vector3(),
	float(),
	int(),
]:
		i = i * 1.0
		i = i * 1



	for i in [
	Color(),
	Vector2(),
	Vector3(),
	float(),
	int(),
]:
		i = i / 1.0
		i = i / 1


	for i in [
	AABB(),
	Array(),
	Basis(),
	Color(),
	Dictionary(),
	NodePath(),
	Plane(),
	PoolByteArray(),
	PoolColorArray(),
	PoolIntArray(),
	PoolRealArray(),
	PoolStringArray(),
	PoolVector2Array(),
	PoolVector3Array(),
	Quat(),
	Rect2(),
	String(),
	Transform(),
	Transform2D(),
	Vector2(),
	Vector3(),
	float(),
	int(),
	bool()
]:
		i == i
		i != i


	for i in [
	String(),
	Vector2(),
	Vector3(),
	float(),
	int(),
]:
		i >= i
		i <= i
		i > i
		i < i


	for i in [
	int()
]:
		i | i
		i & i

	for i in [
	AABB(),
	Array(),
	Basis(),
	Color(),
	Dictionary(),
	NodePath(),
	Plane(),
	PoolByteArray(),
	PoolColorArray(),
	PoolIntArray(),
	PoolRealArray(),
	PoolStringArray(),
	PoolVector2Array(),
	PoolVector3Array(),
	Quat(),
	Rect2(),
	String(),
	Transform(),
	Transform2D(),
	Vector2(),
	Vector3(),
	float(),
	int(),
	bool()
]:
		i || i
		i && i

	for i in [
	int(),
]:
		i = i % 10

	for i in [
	Array(),
	Dictionary(),
	String(),
]:
		i in i

	for i in [
	float(),
	int(),
	bool()
]:
		i as int

	for i in [
	AABB(),
	Array(),
	Basis(),
	Color(),
	Dictionary(),
	NodePath(),
	Plane(),
	PoolByteArray(),
	PoolColorArray(),
	PoolIntArray(),
	PoolRealArray(),
	PoolStringArray(),
	PoolVector2Array(),
	PoolVector3Array(),
	Quat(),
	Rect2(),
	String(),
	Transform(),
	Transform2D(),
	Vector2(),
	Vector3(),
	float(),
	int(),
	bool()
]:
		typeof(i)
		
