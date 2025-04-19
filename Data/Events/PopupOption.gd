extends Resource
class_name PopupOption

##If enabled, option will be available even if condition is not filled (it will however, be unclickable)
@export
var always_visible : bool

##If let empty, option is always available
@export
var condition : Select

@export
var entries : Array[Selection_Log]

@export
var text : String

## When in days the option will be automatically selected. Keep at -1 if it shouldn't be automatically selected
@export
var auto_select_after : int = -1

var _time_created : int

func available() -> bool:
	if condition:
		return len(condition.export_scope()) != 0
	else:
		return true
	pass
