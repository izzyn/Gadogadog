extends PanelContainer

var drag_position = null

@export
var eventid : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("gui_input", _on_gui_input)
	pass # Replace with function body.

func _on_gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			get_parent().move_child(self, len(get_parent().get_children())-1)
			drag_position = get_global_mouse_position() - global_position
		else:
			drag_position = null
	if event is InputEventMouseMotion and drag_position:
		global_position = get_global_mouse_position() - drag_position
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
