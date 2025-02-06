extends Log_Entry
class_name Temp_Log

#duration in days
var duration : int
var event : Log_Entry
var start : int
var revoked : bool

func enact():
	event.enact()
	Log.time_updated.connect(update_timer)
	pass

func update_timer(time):
	if start+duration >= time:
		event.revoke()
		revoked = true
	pass

func revoke():
	if not revoked:
		event.revoke()
	pass
