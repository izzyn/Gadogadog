extends Resource
class_name Resource_Type

@export
var icon : Texture
@export
var amount : int
@export
var income : Dictionary

func update_amount():
	for i in income:
		amount += income[i]
	pass

func display_income() -> String:
	var total = 0
	for i in income:
		total += income[i]
	var totalstr = str(total)
	if total >= 0:
		totalstr = "+" + totalstr
	return totalstr 
	pass

func income_tooltip() -> String:
	var result = ""
	for i in income:
		if income[i] == 0: continue
		var incomestr = str(income[i])
		var color = "red"
		if income[i] >= 0:
			color = "green"
			incomestr = "+" + incomestr
		result += i + ": " + ("[color=%s]" % color) + incomestr + "[/color]\n"
	return result
	pass
