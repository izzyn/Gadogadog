extends Node

var log : Array[Log_Entry]
var completed_events : Dictionary

@export
var possible_events : Array[Popup_Data]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func append_log(event : Log_Entry) -> void:
	event.enact()
	log.append(event)
	get_tree().root.get_node("Map/CanvasLayer/Control/MarginContainer/HBoxContainer2/MarginContainer/PanelContainer/MarginContainer/HBoxContainer").update_bar()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
