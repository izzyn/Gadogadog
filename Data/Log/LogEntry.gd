extends Resource
class_name Log_Entry

@export
var affected_country : String

func pre_enact():
	if affected_country == "current":
		affected_country = CountryData.player_country_id
	pass
func enact():
	print("Not Implemented")
	pass
	
func revoke():
	print("Not Implemented")
	pass

func get_tooltip() -> String:
	return ""
	pass
