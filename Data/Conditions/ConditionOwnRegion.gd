extends Condition
class_name Condition_Own_Region

@export
var region_id : String

@export
var country_id : String

func check(who):
	return Log.regions[region_id].owning_country == who
	pass
