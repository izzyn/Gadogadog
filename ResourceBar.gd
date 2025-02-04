extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("MoneyUI").set_resource(CountryData.countries[CountryData.player_country_id].resources["money"])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
