extends Resource
class_name Cooldown

@export
var days_left : int

@export
var days_total : int

signal cooldown_up

func _init() -> void:
	Log.time_updated.connect(update_cooldown)
	pass

func reset():
	days_left = days_total
	pass

func check():
	if days_left <= 0:
		return true
	else:
		return false
	pass

func update_cooldown(day, month, year):
	days_left -= 1
	if days_left == 0:
		cooldown_up.emit()
	pass
