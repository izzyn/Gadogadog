extends Resource
class_name Popup_Data

@export
var ID : String

@export 
var title : String

@export
var image : Texture

@export
var flavour_text : String

## Events that will trigger no matter the option picked
@export
var always_trigger_events : Array[Log_Entry]

## When event is triggered, show to all players
@export
var global : bool

## Makes the option unable to appear after having appeared once
@export 
var appears_once : bool

var _has_appeared : bool

@export
var condition : Condition

@export
var options : Array[PopupOption]

func _process_properties_recursively(obj: Resource, visited: Dictionary):
	if visited.has(obj):
		return
	visited[obj] = true

	# 1. Run this resource's initialization
	if obj is Fetch_Country:
		obj.duplicate()
		obj._init()

	for prop in obj.get_property_list():
		var prop_name = prop["name"]
		if _is_stored_property(prop):
			var value = obj.get(prop_name)
			_handle_value_recursively(value, visited)

func _handle_value_recursively(value, visited: Dictionary):
	if value is Resource:
		if not visited.has(value):
			_process_properties_recursively(value, visited)
	elif value is Array:
		for item in value:
			_handle_value_recursively(item, visited)
	elif value is Dictionary:
		for key in value:
			_handle_value_recursively(value[key], visited)

func _is_stored_property(prop: Dictionary) -> bool:
	# Check if the property is stored (not a temporary or script variable)
	return (prop["usage"] & PROPERTY_USAGE_STORAGE) != 0
