extends Resource
class_name Popup_Data

@export
var ID : String

@export
var title : String

@export
var image : Texture

@export
var flavour_text : String

## Events that will trigger no matter the option picked
@export
var always_trigger_events : Array[Log_Entry]

## When event is triggered, show to all players
@export
var global : bool

## Makes the option unable to appear after having appeared once
@export 
var appears_once : bool

var _has_appeared : bool

@export
var condition : Condition

@export
var options : Array[PopupOption]
