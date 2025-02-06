extends Resource
class_name Country_Info

@export
var name : String = "TestCountry"

@export
var logo : Texture

@export
var color : Color

@export
var events : Array[Popup_Data]
##resources, is a dictionary of type Key: String -> Value: Resource_Type
@export
var resources : Dictionary = {
	"money" : load("res://Resources/money.tres").duplicate()
}
