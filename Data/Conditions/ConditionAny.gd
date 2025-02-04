extends Condition
class_name Condition_Any

@export
var conditions : Array[Condition]

func check() -> bool:
	for i in conditions:
		if i.check():
			return true
	return false
	pass
