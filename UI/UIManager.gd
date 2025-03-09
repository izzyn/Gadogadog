extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

signal update_ui

var last_caller : Node = null
func create_popup(data : Popup_Data):
	var popup = get_node("EventPopup").duplicate()
	popup.get_node("VBoxContainer2/MarginContainer2/VBoxContainer2/Label").text = data.title
	var body = popup.get_node("VBoxContainer2/MarginContainer/VBoxContainer")
	popup.get_node("VBoxContainer2/TextureRect").texture = data.image
	body.get_node("Label2").text = data.flavour_text
	data._has_appeared = true
	for i in data.options:
		if i.available():
			var button = preload("res://UI/PopupButton.tscn").instantiate()
			button.text = i.text
			var entries = i.entries.duplicate(true)
			if data.always_trigger_events:
				var always_trigger = data.always_trigger_events.duplicate(true)
				entries.append_array(always_trigger)
			for j in entries:
				button.tooltip += j.get_tooltip() + "\n"
			if i.auto_select_after != -1:
				button.auto_select_after = i.auto_select_after
				var calendar = Log.get_calendar(i.auto_select_after + Log.current_day)
				button.tooltip += "[color=yellow]Will be automatically selected by:[/color] "  + str(calendar[0]) + "/" + str(calendar[1]) + "/" + str(calendar[2])
			button.time_created = Log.current_day
			button.entries = entries
			body.add_child(button)
	popup.visible = true
	add_child(popup)
	pass

func create_tooltip(text : String, caller : Node = null):
	last_caller = caller
	get_node("InfoWindow/PanelContainer/MarginContainer/VBoxContainer/RichTextLabel").text = text
	get_node("InfoWindow").visible = true
	pass

func update_tooltip(text : String, caller: Node = null):
	if caller != null and caller == last_caller:
		get_node("InfoWindow/PanelContainer/MarginContainer/VBoxContainer/RichTextLabel").text = text
	pass

func hide_tooltip():
	get_node("InfoWindow").visible = false
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_node("InfoWindow").visible:
		get_node("InfoWindow").global_position = get_viewport().get_mouse_position()
	pass
