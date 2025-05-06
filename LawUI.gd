extends VBoxContainer


@export
var law_id : String

var _law_buttons : Array[Button]

func _ready() -> void:
	var dropdown : Button = get_node("Drop Down Button")
	dropdown.text = CountryData.countries[CountryData.player_country_id].laws[law_id].law_name
	dropdown.pressed.connect(toggle_dropdown)
	var Laws = CountryData.countries[CountryData.player_country_id].laws[law_id].policies
	for law in range(Laws.size()):
		var law_button = Button.new()
		law_button.text = Laws[law].title
		law_button.pressed.connect(apply_law.bind(law))
		law_button.mouse_entered.connect(get_law_tooltip.bind(law))
		law_button.mouse_exited.connect(UiManager.hide_tooltip)

		law_button.visible  = false
		add_child(law_button)
		_law_buttons.append(law_button)
	pass

func get_law_tooltip(index):
	var Law = CountryData.countries[CountryData.player_country_id].laws[law_id].policies[index]
	UiManager.create_tooltip("[b]%s[/b]\n\n--\n[color=gray]%s[/color]" % [Law.title, Law.flavour], _law_buttons[index])
	pass

func apply_law(index):
	CountryData.countries[CountryData.player_country_id].laws[law_id].selected = index
	pass

func toggle_dropdown() -> void:
	for button in _law_buttons:
		button.visible = !button.visible
	pass
