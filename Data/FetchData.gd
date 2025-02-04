extends Resource
class_name Fetch_Data

func fetch() -> int:
	return 0
	pass

class Constant extends Fetch_Data:
	@export
	var Value : int
	func fetch() -> int:
		return Value
		pass

class Country_Resource extends Fetch_Data:
	@export
	var country_id : String
	var country_resource_id : String
	
	func fetch() -> int:
		return CountryData.countries[country_id].resources[country_resource_id].amount
		pass
