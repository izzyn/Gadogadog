extends Node

@export
var player_country_id : String

@export
var countries : Dictionary[String,Country_Info]

@export
var default_resources : Dictionary[String, Resource_Type]

@export
var default_laws : Dictionary[String, Law_Data]

# Called when the node enters the scene tree for the first time.
func _enter_tree() -> void:
	print("a")
	for country in countries:
		for resource in default_resources:
			if resource not in countries[country].resources.keys():
				print(resource)
				print(country)
				countries[country].resources[resource] = default_resources[resource].duplicate()
		for law in default_laws:
			if law not in countries[country].laws.keys():
				countries[country].laws[law] = default_laws[law].duplicate()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
