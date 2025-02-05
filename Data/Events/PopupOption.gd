extends Resource
class_name PopupOption

##If enabled, option will be available even if condition is not filled (it will however, be unclickable)
@export
var always_visible : bool

##If let empty, option is always available
@export
var condition : Condition

@export
var entries : Array[Log_Entry]

@export
var text : String

func available() -> bool:
	if condition:
		return condition.check()
	else:
		return true
	pass
