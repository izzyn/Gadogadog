extends Button

var building_id = ""
var region_name = ""
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("mouse_entered", tooltip)
	connect("mouse_exited", UiManager.hide_tooltip)
	pass # Replace with function body.

func get_tooltip_string() -> String:
	var str = ""
	for i in Log.buildings[building_id].cost:
		var color = ""
		str += "[img=20]" + CountryData.countries[CountryData.player_country_id].resources[i].icon.resource_path + "[/img] "
		if CountryData.countries[CountryData.player_country_id].resources[i].amount < Log.buildings[building_id].cost[i]:
			str += "[color=red]"
		str += str(Log.buildings[building_id].cost[i])
		if CountryData.countries[CountryData.player_country_id].resources[i].amount < Log.buildings[building_id].cost[i]:
			str += "[/color]"
		str += "\n"
	return str
	pass

func tooltip():
	UiManager.create_tooltip(get_tooltip_string(), self)
	pass

func _pressed() -> void:
	if !disabled:
		for i in Log.buildings[building_id].cost:
			CountryData.countries[CountryData.player_country_id].resources[i].amount - Log.buildings[building_id].cost[i]
		var region = get_tree().root.get_node("Map/Node/%s" % region_name)
		if building_id in region.buildings.keys():
			region.buildings[building_id] += 1
		else:
			region.buildings[building_id] = 1
		
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var enable = true
	for i in Log.buildings[building_id].cost:
		if CountryData.countries[CountryData.player_country_id].resources[i].amount < Log.buildings[building_id].cost[i]:
			enable = false
	
	if disabled and enable:
		disabled = false
		UiManager.update_tooltip(get_tooltip_string(), self)
	elif !disabled and !enable:
		disabled = true
		UiManager.update_tooltip(get_tooltip_string(), self)
	pass
