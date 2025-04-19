extends Condition
class_name Condition_All

@export
var conditions : Array[Condition]

func check(who) -> bool:
	for i in conditions:
		if not i.check(who):
			return false
	return true
	pass
