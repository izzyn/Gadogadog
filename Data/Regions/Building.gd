extends Resource
class_name Building

@export 
var icon : Texture

@export
var name : String

@export
var flavour_text : String
# Resource -> Tuple(Destination, amount)
var income : Dictionary

var upkeep : Dictionary 

# Name -> Tuple(Destination, Tuple(Resource, Amount))
var modifiers : Dictionary
