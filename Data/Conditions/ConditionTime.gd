extends Condition
## Condition for: this thing only happens every X years or X months or X days
## For example if you wanted something to only happen every decade it would be every
class_name Condition_Time

enum time_type {day, month, year}

@export
var type : time_type

## Length of time type (so the X in X years)
@export
var length : int

func check():
	var calendar = Log.get_calendar(Log.current_day)
	match type:
		time_type.day:
			return calendar[0] % length == 0
		time_type.month:
			return calendar[1] % length == 0 and calendar[0] == 1
		time_type.year:
			return calendar[2] % length and calendar[0] == 1 and calendar[1] == 1
	pass
