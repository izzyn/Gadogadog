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
		var event = i.duplicate(true)
		event._process_properties_recursively(event, {})
		var condition = true
		if event.condition:
			condition = event.condition.check()
		if condition and CountryData.player_country_id == affected_country.country_id and !(event.appears_once and event._has_appeared):
			print("C")
			i._has_appeared = true
			UiManager.create_popup(event)
	pass

func revoke():
	if day == 1:
		for i in affected_country.fetch().resources:
			for j in affected_country.fetch().resources[i].income:
				affected_country.fetch().resources[i].amount -= affected_country.fetch().resources[i].income[j]
	pass
