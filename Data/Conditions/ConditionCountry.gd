extends Condition
class_name Condition_Country

@export
var country_id : String

func check():
	if Log.update_country == country_id:
		return true
	else:
		return false
	pass
