extends Resource
class_name Fetch_Country


@export
var country_id : String

func _init() -> void:
	pass

func setvariable() -> void:
	if country_id == "current" and Log.update_country != "":
		country_id = Log.update_country
	if country_id == "":
		print("?")
	pass

func fetch() -> Country_Info:
	return CountryData.countries[country_id]
	pass
