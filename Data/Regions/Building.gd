extends Resource
class_name Building

@export 
var icon : Texture

@export
var name : String

@export
var flavour_text : String

@export
# Resource -> Tuple(Destination, amount)
var income : Dictionary

@export
var upkeep : Dictionary 

@export
# Name -> Tuple(Destination, Tuple(Resource, Amount))
var modifiers : Dictionary
