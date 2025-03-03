extends Log_Entry
class_name Transaction

@export
var resource_type : String

@export
var amount : int 

func enact():
	affected_country.fetch().resources[resource_type].amount += amount
	pass
	
func revoke():
	affected_country.fetch().resources[resource_type].amount -= amount
	pass

func get_tooltip():
	var adjective = "gains "
	var amountstr = str(amount)
	if amount < 0:
		amountstr = "[color=red]" + amountstr.replace('-', '') + "[/color]"
		adjective = "loses "
	else:
		amountstr = "[color=green]" + amountstr + "[/color]"
	return affected_country.fetch().name + " " + adjective + ("[img=20]%s[/img]" % affected_country.fetch().resources[resource_type].icon.resource_path) + amountstr
	pass
