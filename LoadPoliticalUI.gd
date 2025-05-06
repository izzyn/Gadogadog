extends Button


@export
var panel : PanelContainer

func _pressed() -> void:
	panel.visible = !panel.visible
	if panel.visible:
		var container = panel.get_node("VBoxContainer")
		for child in container.get_children():
			child.queue_free()
		for law in CountryData.countries[CountryData.player_country_id].laws:
			var node = preload("res://UI/LawUI.tscn").instantiate()
			node.law_id = law
			container.add_child(node)
	pass
