extends Node

var log : Array[Log_Entry]
var completed_events : Dictionary

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func append_log(event : Log_Entry) -> void:
	event.enact()
	log.append(event)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
