extends Condition

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
	if Log.completed_events.has(eventid):
		if global:
			return true and !inverted
		else: if countryid in Log.completed_events[eventid]:
			return true and !inverted
	return false or inverted
	pass
