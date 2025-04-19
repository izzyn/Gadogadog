extends Fetch_Data
class_name Country_Resource

@export
var country_id : String = "Country_ID"

@export
var country_resource_id : String 

func fetch(who = country_id) -> int:
	return CountryData.countries[who].resources[country_resource_id].amount
	pass
