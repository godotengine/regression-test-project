extends Node

### Contains info about disabled classes and allows to take info about allowed methods

# Globablly disabled functions for all classes
var function_exceptions: Array = [
	# They exists without assigment like Class.method, because they may be a parent of other objects and children also should have disabled child.method, its children also etc. which is too much to do
	###
	### Godot 4.0
	###
	"set_mesh",  # 55266
	"set_use_all_surfaces",  # 55266
	"set_visibility_range_begin_margin",  #54655
	"set_visibility_range_begin",  #54655
	"map_pattern",  #54103
	"_broadcast",  #53873
	"get_indexed",  #53840
	"make_polygons_from_outlines",  #53808
	"set_clip_children",  #53667
	"set_base",  #53723
	"set_polygon",  #53722
	"add_bone",  #53646
	"set_bone_children",  #53646
	"global_pose_z_forward_to_bone_forward",  #53646
	"lightmap_unwrap",  # 52929
	"get_property_list",  #53604
	"set_projector",  #53604
	"commit",  #53191
	"commit_to_arrays",  #53191
	"popup_centered_ratio",  #53566
	"set_stream",  #52853
	"shaped_text_draw_outline",  #53562
	"set_input_as_handled",  #53560
	"add_node",  #53558
	"set_language",  #53218
	"set_texture",  #46828
	"_activate",  #45984
	"compress_from_channels",  # Image
	"open_midi_inputs",  #52821
	"load_threaded_request",  #46762
	"bake_navigation_mesh",  # TODO too hard to find for now
	"set_is_setup",  # Just don't use, in SkeletonModification crashes
	"_update_shape",  # TODO, probably crashes exported build
	"get_custom_monitor",  # TODO crashes only in exported build
	###
	### Input crashes, still are some problems TODO
	###
	"_gui_input",
	"_input",
	"_unhandled_input",
	"_unhandled_key_input",
	"_vp_input",
	"_vp_unhandled_input",
	###
	### Reported crashes
	###
	"lightmap_unwrap",  # 52929
	"replace_by",  #53775
	"bake",  #53774
	"create_debug_tangents",  #53182
	"create_from_mesh",  #53181
	"remove_line",  # 49571 - Memory leak
	"connect_to_signal",  # 53622
	"set_extra_cull_margin",  # 53623
	"_thread_done",  #53621
	"set_physics_enabled",  #53620
	"_iter_init",  #53554
	"set_block_signals",  #53553
	"make_atlas",  #51154
	"set_basic_type",  #53456
	"set_custom_viewport",  #53445
	"_draw_soft_mesh",  #53437
	"light_unwrap",  #52929
	"create_action",  #50769
	"_editor_settings_changed",  # 45979
	"set_script",  #46120
	"set_icon",  #46189
	"set_editor_hint",  #46252 - Fixed only for master(due compatibility)
	"set_probe_data",  #46570
	"add_vertex",  #47066
	"create_shape_owner",  #47135
	"shape_owner_get_owner",  #47135
	"get_bind_bone",  #47358
	"get_bind_name",  #47358
	"get_bind_pose",  #47358
	"decompress",  #50787
	"convert",  # 46479
	"save_png_to_buffer",  # 50787
	###
	### Not worth to check, cause a lot of crashes but it is very unlikelly that users will use them
	###
	"propagate_notification",
	"notification",
	###
	### Error spam when using it TODO
	###
	"get_recognized_extensions_for_type",  # Spam
	"load",  # Spam - _ResourceLoader
	"add_sphere",
	"_update_inputs",
	"update_bitmask_region",
	"set_enabled_inputs",
	###
	### Slow Function
	###
	"set_pre_process_time",
	"create_convex_collision",
	"create_multiple_convex_collisions",
	"load_webp_from_buffer",
	"_update_sky",
	"interpolate_baked",
	"get_baked_length",
	"get_baked_points",
	"get_closest_offset",
	"get_closest_point",  # Only Curve, but looks that a lot of other classes uses this
	"get_baked_up_vectors",
	"interpolate_baked_up_vector",
	"tessellate",
	"get_baked_tilts",
	"set_enabled_inputs",
	"grow_mask",
	"force_update_transform",
	"is_enabler_enabled",
	"set_enabler",
	"get_aabb",
	"set_aabb",
	"is_on_screen",
	"set_rings",
	"set_amount",
	###
	### Do not save files and create files and folders, this probably can be enabled in CI
	###
	"pck_start",
	"save",
	"save_png",
	"save_to_wav",
	"save_to_file",
	"make_dir",
	"make_dir_recursive",
	"save_encrypted",
	"save_encrypted_pass",
	"save_exr",
	"dump_resources_to_file",
	"dump_memory_to_file",
	###
	### This also allow to save files
	###
	"open",
	"open_encrypted",
	"open_encrypted_with_pass",
	"open_compressed",
	###
	### Do not warp mouse, because I'm unable to do anything
	###
	"warp_mouse",
	"warp_mouse_position",
	###
	### OS
	###
	"kill",
	"shell_open",
	"execute",
	"alert",  # Stupid alert window opens
	###
	### Godot freeze or run very cslow
	###
	"poll",
	"delay_usec",
	"delay_msec",
	"wait_to_finish",
	"accept_stream",
	"connect_to_stream",
	"discover",
	"wait",
	"debug_bake",
	"bake",
	"set_gizmo",  # Stupid function, needs as parameter an object which can't be instanced # TODO, create issue to hide it
	###
	### Spams Output and aren't very useful
	###
	"print_tree",
	"print_stray_nodes",
	"print_tree_pretty",
	"print_all_textures_by_size",
	"print_all_resources",
	"print_resources_in_use",
	###
	### Can call other functions and broke everything
	###
	"_call_function",
	"call",
	"call_deferred",
	"callv",
	"call_func",
	###
	### Too dangerous, because add, mix and remove randomly nodes and objects
	###
	"replace_by",
	"create_instance",
	"set_owner",
	"set_root_node",
	"instantiate",
	"init_ref",
	"reference",
	"unreference",
	"new",
	"duplicate",
	"queue_free",
	"free",
	"remove_and_skip",
	"remove_child",
	"move_child",
	"raise",
	"add_child",
	"add_sibling",
	#####
	##### Goost
	##### TODO: these take too long to execute, does not make sense to limit number of iterations ether.
	##### TODO - remove this and put it into setting file
	#####
	"smooth_polyline_approx",
	"smooth_polygon_approx",
]

# Globally disabled classes which causes bugs or are very hard to use properly
var disabled_classes: Array = [
	"GLTFDocument",  # TODO memory leak
	###
	### Crashes, Freezes
	###
	"ProjectSettings",  # Don't mess with project settings, because they can broke entire your workflow
	"EditorSettings",  # Also don't mess with editor settings
	"GDScript",  # Broke script
	"SceneTree",
	"JNISingleton",  # Freeze - who use it?
	"Engine",  # Crashes only in Godot 4 but not really usable
	###
	### JavaClass is only functions that returns Null when using JavaClass.new().get_class
	###
	"JavaClass",
	###
	### Android
	###
	"JavaClassWrapper",  # Looks that JavaClassWrapper.new() crashes android
	###
	### Exported build - some checks are disabled in exported build due to too big performance impact
	###
	"Image",
	# TODOGODOT4 - update here exluded list from Godot4
	###
	### Godot 4.0
	###
	"OS",
	"Thread",
	"Semaphore",
	"Mutex",
	"GodotSharp",
	# Class which is non instantable, and have non instantable childrens, but
	# is used as argument
	"Node3DGizmo",
	# Creating them is really slow in Godot 4.0
	"ColorPicker",
	"FileDialog",
	"ColorPickerButton",
	"PhysicalSkyMaterial",
	"ProceduralSkyMaterial"
]


# Checks if function can be executed
# Looks at its arguments and checks if are recognized and supported
func check_if_is_allowed(method_data: Dictionary) -> bool:
	# Function is virtual or vararg, so we just skip it
	if method_data["flags"] == method_data["flags"] | METHOD_FLAG_VIRTUAL:
		return false
	if method_data["flags"] == method_data["flags"] | 128:  # VARARG TODO, Godot issue, add missing flag binding
		return false

	for arg in method_data["args"]:
		var name_of_class: String = arg["class_name"]
		if name_of_class in disabled_classes:
			return false

		if !ClassDB.class_exists(name_of_class):
			return false

		if !name_of_class.is_empty() && !ClassDB.is_parent_class(name_of_class, "Node") && !ClassDB.is_parent_class(name_of_class, "RefCounted"):
			return false

		if name_of_class.find("Editor") != -1 || name_of_class.find("SkinReference") != -1:
			return false

		# In case of adding new type, this prevents from crashing due not recognizing this type
		# In case of removing/rename type, just comment e.g. TYPE_ARRAY and all occurencies on e.g. switch statement with it
		var t: int = arg["type"]
		print(t + " #############################################")
		if !(
			t == TYPE_NIL
			|| t == TYPE_CALLABLE
			|| t == TYPE_MAX
			|| t == TYPE_AABB
			|| t == TYPE_ARRAY
			|| t == TYPE_BASIS
			|| t == TYPE_BOOL
			|| t == TYPE_COLOR
			|| t == TYPE_PACKED_COLOR_ARRAY
			|| t == TYPE_DICTIONARY
			|| t == TYPE_INT
			|| t == TYPE_PACKED_INT32_ARRAY
			|| t == TYPE_PACKED_INT64_ARRAY
			|| t == TYPE_NODE_PATH
			|| t == TYPE_OBJECT
			|| t == TYPE_PLANE
			|| t == TYPE_QUATERNION
			|| t == TYPE_PACKED_BYTE_ARRAY
			|| t == TYPE_FLOAT
			|| t == TYPE_PACKED_FLOAT32_ARRAY
			|| t == TYPE_PACKED_FLOAT64_ARRAY
			|| t == TYPE_RECT2
			|| t == TYPE_RECT2I
			|| t == TYPE_RID
			|| t == TYPE_STRING
			|| t == TYPE_STRING_NAME
			|| t == TYPE_PACKED_STRING_ARRAY
			|| t == TYPE_TRANSFORM3D
			|| t == TYPE_TRANSFORM2D
			|| t == TYPE_VECTOR2
			|| t == TYPE_VECTOR2I
			|| t == TYPE_PACKED_VECTOR2_ARRAY
			|| t == TYPE_VECTOR3
			|| t == TYPE_VECTOR3I
			|| t == TYPE_PACKED_VECTOR3_ARRAY
		):
			print("----------------------------------------------------------- TODO - MISSING TYPE, ADD SUPPORT IT")  # Add assert here to get info which type is missing
			return false

		if name_of_class.is_empty():
			continue

	return true


# Removes disabled methods from classes
func remove_disabled_methods(method_list: Array, exceptions: Array) -> Array:
	var new_list: Array = []  # Workaround for GH 50139 renaming remove to remove_at
	for method_index in range(method_list.size()):
		var index: int = -1
		for exception in exceptions:
			if method_list[method_index].get("name") == exception:
				index = method_index
				break
		if index == -1:
			new_list.append(method_list[method_index])

	method_list = new_list
	return new_list


# Return all available classes which can be used
func get_list_of_available_classes(must_be_instantable: bool = true) -> Array:
	var full_class_list: Array = Array(ClassDB.get_class_list())
	var classes: Array = []
	full_class_list.sort()
	var c = 0
	for name_of_class in full_class_list:
		if name_of_class in disabled_classes:
			continue

		#This is only for RegressionTestProject, because it needs for now clear visual info what is going on screen, but some nodes broke view
		if !ClassDB.is_parent_class(name_of_class, "Node") && !ClassDB.is_parent_class(name_of_class, "RefCounted"):
			continue
		# Don't test Servers objects like TranslationServer
		if name_of_class.find("Server") != -1:
			continue
		# Don't test Editor nodes
		if name_of_class.find("Editor") != -1:
			continue

		if !must_be_instantable || ClassDB.can_instantiate(name_of_class):
			classes.push_back(name_of_class)
			c += 1

	print(str(c) + " choosen classes from all " + str(full_class_list.size()) + " classes.")
	return classes
