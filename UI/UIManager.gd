extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_popup(Log.possible_events[0])
	pass # Replace with function body.

func create_popup(data : Popup_Data):
	var popup = get_node("EventPopup").duplicate()
	popup.get_node("VBoxContainer2/MarginContainer2/VBoxContainer2/Label").text = data.title
	var body = popup.get_node("VBoxContainer2/MarginContainer/VBoxContainer")
	popup.get_node("VBoxContainer2/TextureRect").texture = data.image
	body.get_node("Label2").text = data.flavour_text
	
	for i in data.options:
		if i.available():
			var button = preload("res://UI/PopupButton.tscn").instantiate()
			button.text = i.text
			for j in i.entries:
				button.tooltip += j.get_tooltip() + "\n"
			button.entries = i.entries
			body.add_child(button)
	popup.visible = true
	add_child(popup)
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
