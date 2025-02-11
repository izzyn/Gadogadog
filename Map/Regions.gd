extends Node

var dict = {}
var clicked 
var hoverdict = {}
@onready
var summary = get_tree().root.get_node("Map").get_node("CanvasLayer/RegionSummary")
@onready
var placename = summary.get_node("PanelContainer/MarginContainer/VBoxContainer2/HBoxContainer/VBoxContainer/Label")
@onready
var countryname = summary.get_node("PanelContainer/MarginContainer/VBoxContainer2/HBoxContainer/VBoxContainer/HBoxContainer/Country")
@onready
var countrytexture = summary.get_node("PanelContainer/MarginContainer/VBoxContainer2/HBoxContainer/TextureRect")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in get_children():
		hoverdict[i] = false;
		var temp = get_children()
		temp.erase(i)
		for j in temp:
			var sharedpoints = 0
			for n in i.polygon:
				if j.polygon.has(n):
					sharedpoints += 1
			if sharedpoints > 1:
				i.neighbours.append(j)
			
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func region_pressed(region):
	summary.visible = false
	for i in get_children():
		i.material.set("shader_parameter/weight", 1.0)
	if region != clicked:
		clicked = region
		selected_territory(region)
	else:
		clicked = null
		
	pass
func selected_territory(region : Polygon2D):
	for i in get_children():
		i.material.set("shader_parameter/weight", 1.0)
	region.material.set("shader_parameter/weight", 2.0)
	for i in region.neighbours: 
		i.material.set("shader_parameter/weight", 1.5)
	summary.visible = true
	placename.text = region.name
	countryname.text = CountryData.countries[region.owning_country].name
	countrytexture.texture = CountryData.countries[region.owning_country].logo
	countryname.label_settings.font_color = CountryData.countries[region.owning_country].color
	pass
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Escape"):
		clicked = null
	pass

func mouse_exited() -> void:
	pass # Replace with function body.
