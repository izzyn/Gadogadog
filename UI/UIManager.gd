extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func create_popup():
	pass

func create_tooltip(text : String):
	get_node("InfoWindow/PanelContainer/MarginContainer/VBoxContainer/RichTextLabel").text = text
	get_node("InfoWindow").visible = true
	pass

func hide_tooltip():
	get_node("InfoWindow").visible = false
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_node("InfoWindow").visible:
		get_node("InfoWindow").global_position = get_viewport().get_mouse_position()
	pass
