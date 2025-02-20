extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_bar()
	pass # Replace with function body.

func update_bar():
	get_node("MoneyUI").set_resource(CountryData.countries[CountryData.player_country_id].resources["money"])
	get_node("MoneyUI2").set_resource(CountryData.countries[CountryData.player_country_id].resources["steel"])

	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
