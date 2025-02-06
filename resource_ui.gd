extends HBoxContainer

@export
var resource : Resource_Type
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
func set_resource(_resource : Resource_Type):
	resource = _resource
	get_node("TextureRect").texture = resource.icon 
	get_node("Label").text = str(resource.amount) + " (" + resource.display_income() + ")"
	pass
func mouse_entered():
	UiManager.create_tooltip(resource.income_tooltip())
	pass

func mouse_exited():
	UiManager.hide_tooltip()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
