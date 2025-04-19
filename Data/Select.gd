extends Resource
class_name Select

@export
var additional_variables : Dictionary[String, Variant]

@export
var additional_global_scopes : Array[String]
@export
var condition : Condition

func export_scope(local_variables : Dictionary = {}, parent_scope : Array[String] = []) -> Array[String]:
	var filter_list = parent_scope.duplicate()
	for i in additional_global_scopes:
		#Expand Variables
		if i in CountryData.countries.keys() or i in Log.regions.keys():
			filter_list.append(i)
		elif i == "All_Countries":
			filter_list.append_array(CountryData.countries.keys().filter(func(x): return x != "world"))
		elif i == "All_Regions":
			filter_list.append_array(Log.regions.keys())
		elif i == "TRIGGER":
			filter_list.append_array(Log.trigger)
		elif i == "Player":
			filter_list.append(CountryData.player_country_id)
	if condition:
		return filter_list.filter(func(x): return condition.check(x))
	else:
		return filter_list.duplicate()
