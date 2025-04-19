extends Resource
class_name Popup_Data

@export
var Region_Event : bool 

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
var always_trigger_events : Array[Selection_Log]

## When event is triggered, show to all players
@export
var global : bool

## Makes the option unable to appear after having appeared once
@export 
var appears_once : bool

var _has_appeared : bool

@export
var trigger : Select

##If set, the event will trigger once for everything outputted in the "trigger" scope
##Otherwise it will trigger once if the trigger scope isn't empty.
@export
var trigger_for_each : bool
@export
var trigger_for : Select

@export
var options : Array[PopupOption]
