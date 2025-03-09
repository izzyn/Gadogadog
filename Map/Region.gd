extends Polygon2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("BoarderLine").points = polygon
	#get_node("Region_Area").mouse_entered.connect(_on_mouse_entered)
	#get_node("Region_Area").mouse_exited.connect(_on_mouse_exited)
	get_node("Region_Area").input_event.connect(input_event)
	pass # Replace with function body.

func input_event(node : Viewport, event : InputEvent, shapde_idx : int):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		get_parent().region_pressed(self)
	pass

func _on_mouse_entered():
	get_parent().hoverdict[self] = true
	pass

func _on_mouse_exited():
	get_parent().hoverdict[self] = false
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	color = CountryData.countries[Log.regions[name].owning_country].color
	pass
