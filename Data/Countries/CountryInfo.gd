extends Resource
class_name Country_Info

@export
var name : String = "TestCountry"

@export
var logo : Texture

@export
var color : Color

@export
var unlocked_buildings : Array[String]

@export
var available_decisions : Array[String]
##resources, is a dictionary of type Key: String -> Value: Resource_Type
@export
var resources : Dictionary[String,Resource_Type]

@export
var laws : Dictionary[String, Law_Data]
