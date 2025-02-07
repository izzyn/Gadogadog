extends Log_Entry
class_name Time_Update_Log

var day : int

func enact():
	if Log.get_calendar(day)[0] == 1:
		for i in CountryData.countries[affected_country].resources:
			for j in CountryData.countries[affected_country].resources[i].income:
				CountryData.countries[affected_country].resources[i].amount += CountryData.countries[affected_country].resources[i].income[j]
	
	var events = CountryData.countries[affected_country].events
	if events:
		if CountryData.countries["world"].events:
			events.append_array(CountryData.countries["world"].events)
		for i in events:
			if i.condition.check() and CountryData.player_country_id == affected_country and !(i.appears_once and i._has_appeared):
				UiManager.create_popup(i)
	pass

func revoke():
	if day == 1:
		for i in CountryData.countries[affected_country].resources:
			for j in CountryData.countries[affected_country].resources[i].income:
				CountryData.countries[affected_country].resources[i].amount -= CountryData.countries[affected_country].resources[i].income[j]
	pass
