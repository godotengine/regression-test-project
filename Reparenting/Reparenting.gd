extends Node

var number_of_nodes : int = -1

func _ready() -> void:
	seed(45)
	
	for _i in range(3):
		add_child(Control.new())
		add_child(Popup.new())
		add_child(WindowDialog.new())
		add_child(AcceptDialog.new())
		add_child(ConfirmationDialog.new())
		add_child(FileDialog.new())
		add_child(PopupDialog.new())
		add_child(PopupMenu.new())
		add_child(PopupPanel.new())
		add_child(Button.new())
		add_child(CheckBox.new())
		add_child(CheckButton.new())
		add_child(ColorPickerButton.new())
		add_child(MenuButton.new())
		add_child(OptionButton.new())
		add_child(ToolButton.new())
		add_child(LinkButton.new())
		add_child(TextureButton.new())
		add_child(Container.new())
		add_child(ColorPicker.new())
		add_child(VBoxContainer.new())
		add_child(HBoxContainer.new())
		add_child(CenterContainer.new())
		add_child(ScrollContainer.new())
		add_child(GraphNode.new())
		add_child(GridContainer.new())
		add_child(HSplitContainer.new())
		add_child(VSplitContainer.new())
		add_child(MarginContainer.new())
		add_child(PanelContainer.new())
		add_child(TabContainer.new())
		add_child(ViewportContainer.new())
		add_child(ColorRect.new())
		add_child(HScrollBar.new())
		add_child(VScrollBar.new())
		add_child(HSlider.new())
		add_child(VSlider.new())
		add_child(ProgressBar.new())
		add_child(SpinBox.new())
		add_child(TextureProgress.new())
		add_child(GraphEdit.new())
		add_child(HSeparator.new())
		add_child(VSeparator.new())
		add_child(ItemList.new())
		add_child(Label.new())
		add_child(LineEdit.new())
		add_child(NinePatchRect.new())
		add_child(Panel.new())
		add_child(ReferenceRect.new())
		add_child(RichTextLabel.new())
		add_child(Tabs.new())
		add_child(TextEdit.new())
		add_child(TextureRect.new())
		add_child(Tree.new())
		add_child(VideoPlayer.new())

		add_child(Node2D.new())
		add_child(AnimatedSprite.new())
		add_child(Area2D.new())
		add_child(KinematicBody2D.new())
		add_child(RigidBody2D.new())
		add_child(StaticBody2D.new())
		add_child(AudioStreamPlayer2D.new())
		add_child(BackBufferCopy.new())
		add_child(Bone2D.new())
		add_child(CPUParticles2D.new())
		add_child(Camera2D.new())
		add_child(CanvasModulate.new())
		add_child(CollisionPolygon2D.new()) # Errors
		add_child(CollisionShape2D.new())
		add_child(DampedSpringJoint2D.new())
		add_child(GrooveJoint2D.new())
		add_child(PinJoint2D.new())
		add_child(Light2D.new())
		add_child(LightOccluder2D.new())
		add_child(Line2D.new())
		add_child(MeshInstance2D.new())
		add_child(MultiMeshInstance2D.new())
		add_child(Navigation2D.new())
		add_child(NavigationPolygonInstance.new())
		add_child(ParallaxLayer.new())
		add_child(Particles2D.new())
		add_child(Path2D.new())
		add_child(PathFollow2D.new())
		add_child(Polygon2D.new())
		add_child(Position2D.new())
		add_child(RayCast2D.new())
		add_child(RemoteTransform2D.new())
		add_child(Skeleton2D.new())
		add_child(Sprite.new())
		add_child(TileMap.new())
		add_child(TouchScreenButton.new())
		add_child(VisibilityNotifier2D.new())
		add_child(VisibilityEnabler2D.new())
		add_child(YSort.new())

		add_child(AnimationPlayer.new())
		add_child(AnimationTree.new())
		add_child(AnimationTreePlayer.new())
		add_child(AudioStreamPlayer.new())
		add_child(CanvasLayer.new())
		add_child(ParallaxBackground.new())
		add_child(HTTPRequest.new())
		add_child(ResourcePreloader.new())
		add_child(Skeleton2D.new())
		add_child(Timer.new())
		add_child(Tween.new())
		add_child(Viewport.new())
		add_child(WorldEnvironment.new())

		add_child(Spatial.new())
		add_child(ARVRAnchor.new())
		add_child(Camera.new())
		add_child(ARVRCamera.new())
		add_child(ClippedCamera.new())
		add_child(InterpolatedCamera.new())
		add_child(ARVRController.new())
		add_child(ARVROrigin.new())
		add_child(AnimatedSprite3D.new())
		add_child(Sprite3D.new())
		add_child(CPUParticles.new())
		add_child(CSGBox.new())
		add_child(CSGCylinder.new())
		add_child(CSGMesh.new())
		add_child(CSGPolygon.new())
		add_child(CSGSphere.new())
		add_child(CSGTorus.new())
		add_child(CSGCombiner.new())
		add_child(ImmediateGeometry.new())
		add_child(MeshInstance.new())
		add_child(SoftBody.new())
		add_child(MultiMeshInstance.new())
		add_child(Particles.new())
		add_child(BakedLightmap.new())
		add_child(DirectionalLight.new())
		add_child(OmniLight.new())
		add_child(SpotLight.new())
		add_child(GIProbe.new())
		add_child(ReflectionProbe.new())
		add_child(Area.new())
		add_child(KinematicBody.new())
		add_child(PhysicalBone.new())
		add_child(RigidBody.new())
		add_child(VehicleBody.new())
		add_child(StaticBody.new())
		add_child(AudioStreamPlayer3D.new())
		add_child(BoneAttachment.new())
		add_child(CollisionPolygon.new())
		add_child(CollisionShape.new())
		add_child(ConeTwistJoint.new())
		add_child(Generic6DOFJoint.new())
		add_child(HingeJoint.new())
		add_child(PinJoint.new())
		add_child(SliderJoint.new())
		add_child(GridMap.new())
		add_child(Listener.new())
		add_child(Navigation.new())
		add_child(NavigationMeshInstance.new())
		add_child(Path.new())
		add_child(PathFollow.new())
		add_child(Position3D.new())
		add_child(ProximityGroup.new())
		add_child(RayCast.new())
		add_child(RemoteTransform.new())
		add_child(Skeleton.new())
		add_child(SpringArm.new())
		add_child(VehicleWheel.new())
		add_child(VisibilityNotifier.new())
		add_child(VisibilityEnabler.new())
		
		
	for i in range(get_child_count()):
		get_child(i).set_name("Node " + str(i))
	
	number_of_nodes = get_child_count()
	
## It is quite easy algorithm to reparent items
# - Add multiple nodes to scene
# - Set name to each
# - In process
#   - Get random node
#   - Remove its parent
#   - Get another random node
#   - If nodes are the same, add node to root one(cannot set self as self parent) and repeat steps
#   - If second node is child of first, add first node to root one(prevents from memory leaks due invalid reparenting)
#   - At the end add first random node as child of second

func _process(delta: float) -> void:
	assert(Performance.get_monitor(Performance.OBJECT_ORPHAN_NODE_COUNT) == 0)
	
	var choosen_node : Node
	var parent_of_node : Node
	for i in range(5):
		var number = "Node " + str(randi() % number_of_nodes)
		choosen_node = find_node(number,true,false)
		parent_of_node = choosen_node.get_parent()
		
		var random_node = find_node("Node " + str(randi() % number_of_nodes),true,false)
		parent_of_node.remove_child(choosen_node)
		
		if choosen_node.find_node(random_node.get_name(),true,false) != null: # Cannot set as node parent one of its child
			add_child(choosen_node)
			continue
		if choosen_node == random_node: # Do not reparent node to self
			add_child(choosen_node)
			continue
		random_node.add_child(choosen_node)
