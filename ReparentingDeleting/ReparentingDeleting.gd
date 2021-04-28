extends Node

# Script first adds nodes to scene, then choose some random nodes and reparents
# them or delete and replace with new ones

## Algorithm
# - Add multiple nodes to scene
# - Set name to each
# - In _process
#   - Get random node
#   - Detach it from its parent
#   - Play with a russian roulette:
#     - If node will be deleted, be sure to get list of its all children and then
#       replace all with new nodes(change also name) and old remove with queue_free()
#   - Get another random node
#   - If nodes are the same, add node to root one(cannot set self as self parent) and repeat steps
#   - If second node is child of first, add first node to root one(prevents from memory leaks due invalid reparenting)
#   - At the end add first random node as child of second

var number_of_nodes: int = 0

# Collected nodes
var collected_nodes: Array = []
# Disabled nodes which won't be used
var disabled_classes: Array = [
	"ReflectionProbe",  #GH 45460
]

var debug_enabled: bool = false


func collect() -> void:
	var classes: Array = ClassDB.get_class_list()
	classes.sort()
	for name_of_class in classes:
		if ClassDB.is_parent_class(name_of_class, "Node"):
			if name_of_class.find("Editor") != -1:  # We don't want to test editor nodes
				continue
			if disabled_classes.has(name_of_class):  # Class is disabled
				continue
			if ClassDB.can_instance(name_of_class):  # Only instantable nodes can be used
				collected_nodes.append(name_of_class)

	if debug_enabled:
		var to_print: String = "DEBUG: List of classes used in ReparentingDeleting scene:\n"
		to_print += "DEBUG: ["
		for index in range(classes.size()):
			to_print += "\"" + classes[index] + "\""
			if index != classes.size() - 1:
				to_print += ", "
		print(to_print)


func _ready() -> void:
	seed(405)
	collect()
	number_of_nodes = max(collected_nodes.size(), 200)  # Use at least all nodes, or more if you want(168 is probably number of all nodes)
	for i in range(number_of_nodes):
		var index = i
		if i >= collected_nodes.size():  # Wrap values
			index = i % collected_nodes.size()

		var child: Node = ClassDB.instance(collected_nodes[index])
		child.set_name("Special Node " + str(i))
		add_child(child)


func _process(delta: float) -> void:
#	assert(Performance.get_monitor(Performance.OBJECT_ORPHAN_NODE_COUNT) == 0) # Don't work good when instancing more than 1 scene, because node queued for deleting

	var choosen_node: Node
	var parent_of_node: Node
	for i in range(5):
		var number: String = "Special Node " + str(randi() % number_of_nodes)
		choosen_node = find_node(number, true, false)
		parent_of_node = choosen_node.get_parent()

		var random_node = find_node("Special Node " + str(randi() % number_of_nodes), true, false)
		parent_of_node.remove_child(choosen_node)

		if randi() % 6 == 0:  # 16% chance to remove node with children
			var names_to_remove: Array = find_all_special_children_names(choosen_node)
			for name_to_remove in names_to_remove:
				var node: Node = ClassDB.instance(collected_nodes[randi() % collected_nodes.size()])
				node.set_name(name_to_remove)
				add_child(node)
			choosen_node.queue_free()
			continue

		if choosen_node.find_node(random_node.get_name(), true, false) != null:  # Cannot set as node parent one of its child
			add_child(choosen_node)
			continue
		if choosen_node == random_node:  # Do not reparent node to self
			add_child(choosen_node)
			continue
		random_node.add_child(choosen_node)


# Finds recusivelly all child nodes which will be also removed to be able to add
# exactly same number of nodes in replacement.
func find_all_special_children_names(node: Node) -> Array:
	var array: Array = []
	array.append(node.get_name())
	for child in node.get_children():
		if child.get_name().begins_with("Special Node"):
			array.append_array(find_all_special_children_names(child))

	return array
