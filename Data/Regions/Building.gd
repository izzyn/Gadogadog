extends Resource
class_name Building

@export 
var icon : Texture

@export
var name : String

@export
var flavour_text : String

## ID -> amount
@export
var cost : Dictionary

## Resource -> amount
@export
var income : Dictionary

@export
var upkeep : Dictionary 

## Name -> amount
@export
var modifiers : Dictionary
