extends Node

var speed : int = 1
var month_days = [31,28,31,30,31,30,31,31,30,31,30,31]

@onready
var timer = get_node("Timer") as Timer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()
	update_calendar()
	pass # Replace with function body.

func restart_timer() -> void:
	if speed != 0:
		timer.wait_time = 1.0 / speed
		timer.start()
	else:
		timer.stop()
	pass

func update_time() -> void:
	var day = CountryData.countries["world"].resources["day"].amount
	var month = CountryData.countries["world"].resources["month"].amount
	var year = CountryData.countries["world"].resources["year"].amount
	
	if month == 2 and year % 4 == 0 and day == 28:
		print("Leap day")
		CountryData.countries["world"].resources["day"].amount += 1
		update_calendar()
		if speed != 0:
			timer.wait_time = 1.0 / speed
			timer.start()
		return
	if day < month_days[month-1]:
		CountryData.countries["world"].resources["day"].amount += 1
	if day >= month_days[month-1]:
		CountryData.countries["world"].resources["day"].amount = 1
		CountryData.countries["world"].resources["month"].amount += 1
	if month >= 13:
		CountryData.countries["world"].resources["year"].amount += 1
		CountryData.countries["world"].resources["month"].amount = 1
	
	update_calendar()
	if speed != 0:
		timer.wait_time = 1.0 / speed
		timer.start()
	
	pass
func update_calendar():
	var day = CountryData.countries["world"].resources["day"].amount
	var month = CountryData.countries["world"].resources["month"].amount
	var year = CountryData.countries["world"].resources["year"].amount
	get_tree().root.get_node("Map/CanvasLayer/Control/MarginContainer/HBoxContainer2/MarginContainer/PanelContainer/MarginContainer/HBoxContainer2/Label").text = str(day) + "/" + str(month) + "/" + str(year)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
