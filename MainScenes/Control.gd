extends GridContainer

var TIME_TO_DELETE : float = 1.0
var time_to_delete : float = TIME_TO_DELETE
	
func _populate() -> void:
	for _i in range(4):
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

func _ready() -> void:
	_populate()

func _process(delta: float) -> void:
	for i in get_children():
		if i is Control:
			i._set_size(Vector2(200 * randf() - 100, 200 * randf() - 100))
			
	time_to_delete -= delta
	if time_to_delete < 0:
		time_to_delete += TIME_TO_DELETE
		
		for i in get_children():
			i.queue_free()
			
		_populate()

