extends Log_Entry
class_name Temporary_Log

##duration in days (for example 1 year is 365 (excluding leap years))
@export
var duration : int

@export
var event : Log_Entry
var start : int
var revoked : bool

func enact():
	start = Log.current_day
	event.enact()
	Log.time_updated.connect(update_timer)
	pass

func update_timer(time):
	if start+duration <= time and !revoked:
		event.revoke()
		revoked = true
	pass

func revoke():
	if not revoked:
		event.revoke()
	pass

func get_tooltip() -> String:
	return event.get_tooltip() + " for " + Log.display_time(duration)
	pass
