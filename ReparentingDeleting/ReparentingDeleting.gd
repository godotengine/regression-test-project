extends Node

var number_of_nodes : int = -1
var node_to_handle_others : Node = Node.new() # Special node to handle all available nodes in tree

func _ready() -> void:
	seed(405)
	
	
	node_to_handle_others.set_name("handle_node")
	
	for i in range(3):
		var parent_node : Node
		if i == 0:
			parent_node = node_to_handle_others
		else:
			parent_node = self
			
		parent_node.add_child(Control.new())
		parent_node.add_child(Popup.new())
		parent_node.add_child(AcceptDialog.new())
		parent_node.add_child(ConfirmationDialog.new())
		parent_node.add_child(FileDialog.new())
		parent_node.add_child(PopupMenu.new())
		parent_node.add_child(PopupPanel.new())
		parent_node.add_child(Button.new())
		parent_node.add_child(CheckBox.new())
		parent_node.add_child(CheckButton.new())
		parent_node.add_child(ColorPickerButton.new())
		parent_node.add_child(MenuButton.new())
		parent_node.add_child(OptionButton.new())
		parent_node.add_child(LinkButton.new())
		parent_node.add_child(TextureButton.new())
		parent_node.add_child(Container.new())
		parent_node.add_child(ColorPicker.new())
		parent_node.add_child(VBoxContainer.new())
		parent_node.add_child(HBoxContainer.new())
		parent_node.add_child(CenterContainer.new())
		parent_node.add_child(ScrollContainer.new())
		parent_node.add_child(GraphNode.new())
		parent_node.add_child(GridContainer.new())
		parent_node.add_child(HSplitContainer.new())
		parent_node.add_child(VSplitContainer.new())
		parent_node.add_child(MarginContainer.new())
		parent_node.add_child(PanelContainer.new())
		parent_node.add_child(TabContainer.new())
		parent_node.add_child(ColorRect.new())
		parent_node.add_child(HScrollBar.new())
		parent_node.add_child(VScrollBar.new())
		parent_node.add_child(HSlider.new())
		parent_node.add_child(VSlider.new())
		parent_node.add_child(ProgressBar.new())
		parent_node.add_child(SpinBox.new())
		parent_node.add_child(TextureProgressBar.new())
		parent_node.add_child(GraphEdit.new())
		parent_node.add_child(HSeparator.new())
		parent_node.add_child(VSeparator.new())
		parent_node.add_child(ItemList.new())
		parent_node.add_child(Label.new())
		parent_node.add_child(LineEdit.new())
		parent_node.add_child(NinePatchRect.new())
		parent_node.add_child(Panel.new())
		parent_node.add_child(ReferenceRect.new())
		parent_node.add_child(RichTextLabel.new())
		parent_node.add_child(Tabs.new())
		parent_node.add_child(TextEdit.new())
		parent_node.add_child(TextureRect.new())
		parent_node.add_child(Tree.new())
		parent_node.add_child(VideoPlayer.new())

		parent_node.add_child(Node2D.new())
#		parent_node.add_child(AnimatedSprite2D.new())
		parent_node.add_child(Area2D.new())
		parent_node.add_child(KinematicBody2D.new())
		parent_node.add_child(RigidBody2D.new())
		parent_node.add_child(StaticBody2D.new())
		parent_node.add_child(AudioStreamPlayer2D.new())
		parent_node.add_child(BackBufferCopy.new())
		parent_node.add_child(Bone2D.new())
		parent_node.add_child(CPUParticles2D.new())
		parent_node.add_child(Camera2D.new())
		parent_node.add_child(CanvasModulate.new())
		parent_node.add_child(CollisionPolygon2D.new())
		parent_node.add_child(CollisionShape2D.new())
		parent_node.add_child(DampedSpringJoint2D.new())
		parent_node.add_child(GrooveJoint2D.new())
		parent_node.add_child(PinJoint2D.new())
		parent_node.add_child(Light2D.new())
		parent_node.add_child(LightOccluder2D.new())
		parent_node.add_child(Line2D.new())
		parent_node.add_child(MeshInstance2D.new())
		parent_node.add_child(MultiMeshInstance2D.new())
		parent_node.add_child(Navigation2D.new())
		parent_node.add_child(ParallaxLayer.new())
		parent_node.add_child(GPUParticles2D.new())
		parent_node.add_child(Path2D.new())
		parent_node.add_child(PathFollow2D.new())
		parent_node.add_child(Polygon2D.new())
		parent_node.add_child(Position2D.new())
		parent_node.add_child(RayCast2D.new())
		parent_node.add_child(RemoteTransform2D.new())
		parent_node.add_child(Skeleton2D.new())
		parent_node.add_child(Sprite2D.new())
		parent_node.add_child(TileMap.new())
		parent_node.add_child(TouchScreenButton.new())
		parent_node.add_child(VisibilityNotifier2D.new())
		parent_node.add_child(VisibilityEnabler2D.new())
		parent_node.add_child(YSort.new())

		parent_node.add_child(AnimationPlayer.new())
		parent_node.add_child(AnimationTree.new())
		parent_node.add_child(AudioStreamPlayer.new())
		parent_node.add_child(CanvasLayer.new())
		parent_node.add_child(ParallaxBackground.new())
		parent_node.add_child(HTTPRequest.new())
		parent_node.add_child(ResourcePreloader.new())
		parent_node.add_child(Skeleton2D.new())
		parent_node.add_child(Timer.new())
		parent_node.add_child(Tween.new())
		parent_node.add_child(Viewport.new())
		parent_node.add_child(WorldEnvironment.new())

		parent_node.add_child(Node3D.new())
		parent_node.add_child(XRAnchor3D.new())
		parent_node.add_child(Camera3D.new())
		parent_node.add_child(XRCamera3D.new())
		parent_node.add_child(ClippedCamera3D.new())
		parent_node.add_child(XRController3D.new())
		parent_node.add_child(XROrigin3D.new())
		parent_node.add_child(AnimatedSprite3D.new())
		parent_node.add_child(Sprite3D.new())
		parent_node.add_child(CPUParticles3D.new())
		parent_node.add_child(CSGBox3D.new())
		parent_node.add_child(CSGCylinder3D.new())
		parent_node.add_child(CSGMesh3D.new())
		parent_node.add_child(CSGPolygon3D.new())
		parent_node.add_child(CSGSphere3D.new())
		parent_node.add_child(CSGTorus3D.new())
		parent_node.add_child(CSGCombiner3D.new())
		parent_node.add_child(ImmediateGeometry3D.new())
		parent_node.add_child(MeshInstance3D.new())
		parent_node.add_child(SoftBody3D.new())
		parent_node.add_child(MultiMeshInstance3D.new())
		parent_node.add_child(GPUParticles3D.new())
		parent_node.add_child(BakedLightmap.new())
		parent_node.add_child(DirectionalLight3D.new())
		parent_node.add_child(OmniLight3D.new())
		parent_node.add_child(SpotLight3D.new())
		parent_node.add_child(GIProbe.new())
#		parent_node.add_child(ReflectionProbe.new())
		parent_node.add_child(Area3D.new())
		parent_node.add_child(KinematicBody3D.new())
		parent_node.add_child(PhysicalBone3D.new())
		parent_node.add_child(RigidBody3D.new())
		parent_node.add_child(VehicleBody3D.new())
		parent_node.add_child(StaticBody3D.new())
		parent_node.add_child(AudioStreamPlayer3D.new())
		parent_node.add_child(BoneAttachment3D.new())
		parent_node.add_child(CollisionPolygon3D.new())
		parent_node.add_child(CollisionShape3D.new())
		parent_node.add_child(ConeTwistJoint3D.new())
		parent_node.add_child(Generic6DOFJoint3D.new())
		parent_node.add_child(HingeJoint3D.new())
		parent_node.add_child(PinJoint3D.new())
		parent_node.add_child(SliderJoint3D.new())
		parent_node.add_child(GridMap.new())
		parent_node.add_child(Listener3D.new())
		parent_node.add_child(Navigation3D.new())
		parent_node.add_child(Path3D.new())
		parent_node.add_child(PathFollow3D.new())
		parent_node.add_child(Position3D.new())
		parent_node.add_child(ProximityGroup3D.new())
		parent_node.add_child(RayCast3D.new())
		parent_node.add_child(RemoteTransform3D.new())
		parent_node.add_child(Skeleton3D.new())
		parent_node.add_child(SpringArm3D.new())
		parent_node.add_child(VehicleWheel3D.new())
		parent_node.add_child(VisibilityNotifier3D.new())
		parent_node.add_child(VisibilityEnabler3D.new())
		
		
		parent_node.add_child(GPUParticlesAttractorBox.new())
		parent_node.add_child(GPUParticlesAttractorSphere.new())
		parent_node.add_child(GPUParticlesAttractorVectorField.new())
		
		parent_node.add_child(GPUParticlesCollisionBox.new())
#		parent_node.add_child(GPUParticlesCollisionHeightField.new())
		parent_node.add_child(GPUParticlesCollisionSphere.new())
		parent_node.add_child(GPUParticlesCollisionSDF.new())
		
		
	for i in range(get_child_count()):
		get_child(i).set_name("Special Node " + str(i))
	
	number_of_nodes = get_child_count()
	
	add_child(node_to_handle_others) # Adding at the end to not broke calculations
	
## It is quite easy algorithm to reparent and delete items
# - Add multiple nodes to scene
# - Set name to each
# - In process
#   - Get random node
#   - Remove its parent
#   - Play with a russian roulette
#   - If node will be deleted, be sure to get list of its all children and then 
#     replace all with new nodes(change also name) and old remove with queue_free()  
#   - Get another random node
#   - If nodes are the same, add node to root one(cannot set self as self parent) and repeat steps
#   - If second node is child of first, add first node to root one(prevents from memory leaks due invalid reparenting)
#   - At the end add first random node as child of second

func _process(delta: float) -> void:
	assert(Performance.get_monitor(Performance.OBJECT_ORPHAN_NODE_COUNT) == 0)
	
	var choosen_node : Node
	var parent_of_node : Node
	for i in range(5):
		var number : String = "Special Node " + str(randi() % number_of_nodes)
		choosen_node = find_node(number,true,false)
		parent_of_node = choosen_node.get_parent()
		
		var random_node = find_node("Special Node " + str(randi() % number_of_nodes),true,false)
		parent_of_node.remove_child(choosen_node)
		
		if randi() % 6 == 0: # 16% chance to remove node with children
			var names_to_remove : Array = find_all_special_children_names(choosen_node)
			for name_to_remove in names_to_remove:
				var node : Node = node_to_handle_others.get_child(randi() % node_to_handle_others.get_child_count()).duplicate(0)
				node.set_name(name_to_remove)
				add_child(node)
			choosen_node.queue_free()
			continue
		
		
		if choosen_node.find_node(random_node.get_name(),true,false) != null: # Cannot set as node parent one of its child
			add_child(choosen_node)
			continue
		if choosen_node == random_node: # Do not reparent node to self
			add_child(choosen_node)
			continue
		random_node.add_child(choosen_node)


func find_all_special_children_names(node : Node) -> Array:
	var array : Array = []
	array.append(node.get_name())
	for child in node.get_children():
		if String(child.get_name()).begins_with("Special Node"):
			array.append_array(find_all_special_children_names(child))
	
	return array
