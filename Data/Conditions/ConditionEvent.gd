extends Condition
class_name Condition_Event
##If on, will enable condition if any country has gotten the event
@export
var global : bool

##Country to check for event, if global is enabled this does nothing.
@export
var countryid : Fetch_Country 

@export
var eventid : String

## Makes the condition true if and only if the event HASNT happened
@export
var inverted : bool


func check() -> bool:
	if Log.completed_events.has(eventid):
		if global:
			return not inverted
		else: if countryid.country_id in Log.completed_events[eventid]:
			return not inverted
	return inverted
	pass
