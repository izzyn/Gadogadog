extends Log_Entry
class_name Time_Update_Log

var day : int

func enact():
	Log.update_country = affected_country.country_id
	CountryData.countries["update"] = CountryData.countries[Log.update_country]
	if Log.get_calendar(day)[0] == 1:
		for i in affected_country.fetch().resources:
			for j in affected_country.fetch().resources[i].income:
				affected_country.fetch().resources[i].amount += affected_country.fetch().resources[i].income[j]
	
	var events = Log.possible_events
	
	for i in events:
		var condition = true
		if i.condition:
			var condition_dupe = i.condition.duplicate(true)
			Log.update_variables(condition_dupe)
			condition = condition_dupe.check()
		if condition and CountryData.player_country_id == affected_country.country_id and !(i.appears_once and i._has_appeared):
			i._has_appeared = true
			var event = i.duplicate(true)
			Log.update_variables(event)
			UiManager.create_popup(event)
	pass

func revoke():
	if day == 1:
		for i in affected_country.fetch().resources:
			for j in affected_country.fetch().resources[i].income:
				affected_country.fetch().resources[i].amount -= affected_country.fetch().resources[i].income[j]
	pass
