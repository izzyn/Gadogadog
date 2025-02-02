extends Node

var dict = {}

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
	var hovered = false
	for i in hoverdict:
		if hoverdict[i]:
			i.material.set("shader_parameter/weight", 2.0)
			for j in i.neighbours:
				j.material.set("shader_parameter/weight", 1.5)
			for j in get_children():
				if j != i && !i.neighbours.has(j):
					j.material.set("shader_parameter/weight", 1.0)
			hovered = true
			summary.visible = true
			placename.text = i.name
			countryname.text = i.owning_country.name
			countrytexture.texture = i.owning_country.logo
			countryname.label_settings.font_color = i.owning_country.color
	if !hovered:
		summary.visible = false
		for i in get_children():
			i.material.set("shader_parameter/weight", 1.0)
	pass
