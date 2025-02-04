extends Condition
class_name Condition_All

@export
var conditions : Array[Condition]

func check() -> bool:
	for i in conditions:
		if not i.check():
			return false
	return true
	pass
