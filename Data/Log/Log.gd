extends Node

var log : Array[Log_Entry]
var completed_events : Dictionary

@export
var world_seed : int
@export
var possible_events : Array[Popup_Data]
var month_days = [31,28,31,30,31,30,31,31,30,31,30,31]

@export
var buildings : Dictionary

@export
var regions : Dictionary

@export
var start_day : int 

var update_country : String

var update_region : String

var current_day : int

signal time_updated(day)

signal update_variable(variable, value)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_day = start_day
	pass # Replace with function body.

func append_log(event : Log_Entry) -> void:
	event.enact()
	log.append(event)
	pass

func update_time():
	var timelog = Update_Day_Log.new()
	append_log(timelog)
	for i in CountryData.countries:
		if i == "world" or i == "current" or i == "update":
			continue
		var newlog = Time_Update_Log.new()
		newlog.affected_country = i
		newlog.day = current_day
		append_log(newlog)
	time_updated.emit(current_day)
	pass

func get_calendar(total_days) -> Array[int]:
	var year = 1
	var month = 1
	var day = 0
	
	var days_left = total_days
	var year_length = 365
	while days_left > year_length:
		days_left -= year_length
		year += 1
		if year % 4 == 0:
			year_length = 366
		else:
			year_length = 365
	while days_left > month_days[month-1]:
		days_left -= month_days[month - 1]
		month += 1
	
	day = days_left
	return [day, month, year]
	pass

func display_time(days) -> String:
	if days > 365:
		return "[color=yellow]" + ("%.1f" % (float(days)/365.25)) + "[/color]" + " years"
	elif days > month_days[CountryData.countries["world"].resources["month"].amount - 1]:
		var t_days_left = days
		var current_month = CountryData.countries["world"].resources["month"].amount
		var months_left = 0
		while t_days_left >= Log.month_days[months_left+current_month-1]:
			t_days_left -= Log.month_days[months_left+current_month-1]
			months_left += 1
		return "[color=yellow]" + str(months_left) + "[/color]" + " months"
	else:
		return "[color=yellow]" + str(days) + "[/color]" + " days"
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func true_deep_copy(obj: Resource, visited : Dictionary = {}) -> Resource:
	#if visited.has(obj):
	#	return
	visited[obj] = true
	for prop in obj.get_property_list():
		var prop_name = prop["name"]
		if _is_stored_property(prop):
			var value = obj.get(prop_name)
			var setvalue = handle_deep_copy_property(value, visited)
			obj.set(prop_name, setvalue)
	return obj
	pass

func handle_deep_copy_property(value, visited : Dictionary = {}):
	if value is Resource:
		return true_deep_copy(value, visited)
	elif value is Array:
		for i in range(value.size()):
			if value[i] is Resource:
				var newres = value[i].duplicate(true)
				newres = true_deep_copy(newres, visited)
				value[i] = newres
			else:
				value[i] = handle_deep_copy_property(i, visited)
		return value
	elif value is Dictionary:
		for key in value:
			if value[key] is Resource:
				var newres = value[key].duplicate(true)
				newres = true_deep_copy(newres, visited)
				value[key] = newres
			else:
				value[key] = handle_deep_copy_property(value[key], visited)
		return value
	else:
		return value
	pass

func update_variables(obj: Resource, visited: Dictionary = {}):
	if visited.has(obj):
		return
	visited[obj] = true

	for prop in obj.get_property_list():
		var prop_name = prop["name"]
		if _is_stored_property(prop):
			
			var value = obj.get(prop_name)
			if (prop["usage"] & PROPERTY_USAGE_SCRIPT_VARIABLE) != 0 and value is String:
				var countryid = Log.update_country
				var countryname = CountryData.countries[countryid].name
				var dict = {"$Country_ID":countryid, "$Country_Name":countryname}
				for key in dict:
					value = value.replace(key, dict[key])
				obj.set(prop_name, value)
			_handle_value_recursively(value, visited)

func _handle_value_recursively(value, visited: Dictionary):
	if value is Resource:
		if not visited.has(value):
			update_variables(value, visited)
	elif value is Array:
		for item in value:
			_handle_value_recursively(item, visited)
	elif value is Dictionary:
		for key in value:
			_handle_value_recursively(value[key], visited)

func _is_stored_property(prop: Dictionary) -> bool:
	# Check if the property is stored (not a temporary or script variable)
	return (prop["usage"] & PROPERTY_USAGE_STORAGE) != 0
