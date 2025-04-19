extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	UiManager.update_ui.connect(update_ui)
	icon = CountryData.countries[CountryData.player_country_id].logo
	pass # Replace with function body.

func update_ui():
	icon = CountryData.countries[CountryData.player_country_id].logo
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
