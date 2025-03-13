extends Log_Entry
class_name Time_Update_Log

var day : int

func enact():
	Log.update_country = affected_country
	var data = CountryData.countries[affected_country]
	CountryData.countries["update"] = CountryData.countries[Log.update_country]
	if Log.get_calendar(day)[0] == 1:
		for i in data.resources:
			for j in data.resources[i].income:
				data.resources[i].amount += data.resources[i].income[j]
	
	var events = Log.possible_events
	
	for i in events:
		var condition = true
		if i.condition:
			var condition_dupe = i.condition.duplicate(true)
			condition_dupe = Log.true_deep_copy(condition_dupe)
			Log.update_variables(condition_dupe)
			condition = condition_dupe.check()
		if condition and CountryData.player_country_id == affected_country and !(i.appears_once and i._has_appeared):
			i._has_appeared = true
			var event = i.duplicate(true)
			event = Log.true_deep_copy(event)
			Log.update_variables(event)
			UiManager.create_popup(event)
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
