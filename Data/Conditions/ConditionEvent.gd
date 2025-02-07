extends Condition
class_name Condition_Event
##If on, will enable condition if any country has gotten the event
@export
var global : bool

##Country to check for event, if global is enabled this does nothing.
@export
var countryid : String 

@export
var eventid : String

## Makes the condition true if and only if the event HASNT happened
@export
var inverted : bool

func check() -> bool:
	var country_check = countryid
	if countryid == "update":
		country_check = Log.update_country
	if countryid == "current":
		country_check = CountryData.player_country_id

	if Log.completed_events.has(eventid):
		if global:
			return not inverted
		else: if country_check in Log.completed_events[eventid]:
			return not inverted
	return inverted
	pass
