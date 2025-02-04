extends Condition

##If on, will enable condition if any country has gotten the event
@export
var global : bool

##Country to check for event, if global is enabled this does nothing.
@export
var countryid : String 

@export
var eventid : String
func check() -> bool:
	if Log.completed_events.has(eventid):
		if global:
			return true
		else: if countryid in Log.completed_events[eventid]:
			return true
	return false
	pass
