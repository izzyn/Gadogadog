extends Log_Entry
class_name Change_Logo_Entry

@export
var new_logo : Texture
var _old_logo : Texture

func enact():
	_old_logo = CountryData[affected_country].logo
	CountryData[affected_country].logo = new_logo
	pass

func revoke():
	CountryData[affected_country].logo = _old_logo
	pass
