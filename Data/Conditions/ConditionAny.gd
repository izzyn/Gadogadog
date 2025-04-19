extends Condition
class_name Condition_Any

@export
var conditions : Array[Condition]

func check(who) -> bool:
	for i in conditions:
		if i.check(who):
			return true
	return false
	pass
