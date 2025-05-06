extends Log_Entry
class_name Change_Colour_Entry

@export
var new_color : Color
var _old_color : Color

func enact():
	_old_color = CountryData[affected_country].color
	CountryData[affected_country].color = new_color
	pass

func revoke():
	CountryData[affected_country].color = _old_color
	pass
