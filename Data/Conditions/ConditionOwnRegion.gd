extends Condition
class_name Condition_Own_Region

@export
var region_id : String

@export
var country_id : Fetch_Country
func check():
	return Log.regions[region_id].owning_country == country_id.country_id
	pass
