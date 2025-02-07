extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	icon = CountryData.countries[CountryData.player_country_id].logo
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
