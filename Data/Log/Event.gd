extends Log_Entry
class_name Event

@export
var ID : String

@export
var event_name : String
func enact():
	if ID in Log.completed_events.keys():
		Log.completed_events[ID].append(affected_country)
	else:
		Log.completed_events[ID] = [affected_country]
	pass

func revoke():
	if ID in Log.completed_events.keys():
		if len(Log.completed_events[ID]) == 1:
			Log.completed_events.erase(Log.completed_events[ID])
		else:
			Log.completed_events[ID].erase(affected_country)
	pass

func get_tooltip() -> String:
	return CountryData.countries[affected_country].name + " gains the event: " + "[color=orange]\"" + event_name + "\"[/color]"
	pass
