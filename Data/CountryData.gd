extends Node

@export
var countries : Dictionary

@export
var player_country_id : String:
	set(value):
			countries["current"] = countries[value]
			player_country_id = value


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
