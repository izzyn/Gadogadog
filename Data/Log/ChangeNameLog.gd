extends Log_Entry
class_name Change_Name_Log

@export
var new_name : String
var _old_name : String

func enact():
	_old_name = CountryData[affected_country].name
	CountryData[affected_country].name = new_name
	pass

func revoke():
	CountryData[affected_country].name = _old_name
	pass
