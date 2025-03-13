extends Fetch_Data
class_name Country_Resource

@export
var country_id : String

@export
var country_resource_id : String = "Country_ID"

func fetch() -> int:
	return CountryData.countries[country_id].resources[country_resource_id].amount
	pass
