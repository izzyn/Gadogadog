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

@export
var cooldown : Cooldown

## When event is triggered, show to all players
@export
var global : bool

@export
var condition : Condition

@export
var options : Array[PopupOption]
