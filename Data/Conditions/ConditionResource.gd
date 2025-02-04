extends Condition
class_name Condition_Resource
enum Type {Equal_Greater_Than, Equal_Lesser_Than, Lesser_Than, Greater_Than, Equal, Not_Equal}

@export
var type : Type

@export
var resource_1 : Fetch_Data

@export
var resource_2 : Fetch_Data

func check() -> bool:
	match type:
		Type.Equal_Greater_Than:
			return resource_1.fetch() >= resource_2.fetch()
		Type.Equal_Lesser_Than:
			return resource_1.fetch() <= resource_2.fetch()
		Type.Lesser_Than:
			return resource_1.fetch() < resource_2.fetch()
		Type.Greater_Than:
			return resource_1.fetch() <= resource_2.fetch()
		Type.Equal:
			return resource_1.fetch() == resource_2.fetch()
		Type.Not_Equal:
			return resource_1.fetch() != resource_2.fetch()
	return false
	pass
