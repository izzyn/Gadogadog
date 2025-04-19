extends Resource
class_name Log_Entry

@export
var affected_country : String

func enact():
	print("Not Implemented")
	pass
	
func revoke():
	print("Not Implemented")
	pass

func get_tooltip(who = affected_country) -> String:
	return _get_tooltip(who)

func _get_tooltip(who) -> String:
	return ""
