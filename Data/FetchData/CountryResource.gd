extends Fetch_Data
class_name Country_Resource

@export
var country_id : Fetch_Country

@export
var country_resource_id : String

func fetch() -> int:
	return country_id.fetch().resources[country_resource_id].amount
	pass
