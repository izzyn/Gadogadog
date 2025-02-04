extends Log_Entry
class_name Transaction

@export
var resource_type : String

@export
var amount : int 

func enact():
	CountryData.countries[affected_country].resources[resource_type].amount += amount
	pass
	
func revoke():
	CountryData.countries[affected_country].resources[resource_type].amount -= amount
	pass

func get_tooltip():
	var adjective = "gains "
	if amount < 0:
		adjective = "[color=red]loses[/color] "
	return CountryData.countries[affected_country].name + " " + adjective + ("[img 20]%s[/img] " % CountryData.countries[affected_country].resources[resource_type].icon) + str(amount)
	pass
