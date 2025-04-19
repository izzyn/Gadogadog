extends Log_Entry
class_name Time_Update_Log

var day : int

func enact():
	Log.update_country = affected_country
	var data = CountryData.countries[affected_country]
	if Log.get_calendar(day)[0] == 1:
		for i in data.resources:
			for j in data.resources[i].income:
				data.resources[i].amount += data.resources[i].income[j]
	pass

func update_income():
	
	pass

func update_regions():
	
	pass
func revoke():
	var data = CountryData.countries[affected_country]
	if day == 1:
		for i in data.resources:
			for j in data.resources[i].income:
				data.resources[i].amount -= data.resources[i].income[j]
	pass
