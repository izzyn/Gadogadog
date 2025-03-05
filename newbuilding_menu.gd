extends PanelContainer

func newbuilding_pressed(): 
	visible = !visible
	if visible:
		var container = get_node("ScrollContainer/VBoxContainer")
		var building_ui = preload("res://UI/NewBuildingUI.tscn")
		for i in CountryData.countries[CountryData.player_country_id].unlocked_buildings:
			var scene = building_ui.instantiate()
			container.add_child(scene)
pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
