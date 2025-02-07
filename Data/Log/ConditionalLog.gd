extends Log_Entry
class_name Conditional_Log

@export
var condition : Condition

@export
var entry : Log_Entry

var _was_enacted : bool

func enact():
	if condition.check():
		_was_enacted = true
		entry.enact()
	else:
		_was_enacted = false
	pass

func revoke():
	if _was_enacted:
		entry.revoke()
	pass
