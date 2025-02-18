extends Log_Entry
class_name Update_Day_Log

func enact():
	Log.current_day += 1
	pass

func revoke():
	Log.current_day -= 1
	pass
