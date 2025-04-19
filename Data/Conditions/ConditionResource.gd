extends Condition
class_name Condition_Resource
enum Type {Equal_Greater_Than, Equal_Lesser_Than, Lesser_Than, Greater_Than, Equal, Not_Equal}

@export
var type : Type

@export
var resource_id : String

@export
var resource : Fetch_Data

func check(who) -> bool:
	var fetchresource = Country_Resource.new()
	fetchresource.country_id = who
	fetchresource.country_resource_id = resource_id
	fetchresource.country_id
	match type:
		Type.Equal_Greater_Than:
			return fetchresource.fetch() >= resource.fetch()
		Type.Equal_Lesser_Than:
			return fetchresource.fetch() <= resource.fetch()
		Type.Lesser_Than:
			return fetchresource.fetch() < resource.fetch()
		Type.Greater_Than:
			return fetchresource.fetch() > resource.fetch()
		Type.Equal:
			return fetchresource.fetch() == resource.fetch()
		Type.Not_Equal:
			return fetchresource.fetch() != resource.fetch()
	return false
	pass
