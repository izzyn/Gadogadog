extends Log_Entry
class_name Transaction

@export
var resource_type : String

@export
var amount : int 

func enact():
	CountryData.countries[affected_country].resources[resource_type].amount += amount
	UiManager.update_ui.emit()
	pass
	
func revoke():
	CountryData.countries[affected_country].resources[resource_type].amount -= amount
	UiManager.update_ui.emit()
	pass

func get_tooltip():
	var adjective = "gains "
	var amountstr = str(amount)
	if amount < 0:
		amountstr = "[color=red]" + amountstr.replace('-', '') + "[/color]"
		adjective = "loses "
	else:
		amountstr = "[color=green]" + amountstr + "[/color]"
	return CountryData.countries[affected_country].name + " " + adjective + ("[img=20]%s[/img]" % CountryData.countries[affected_country].resources[resource_type].icon.resource_path) + amountstr
	pass
