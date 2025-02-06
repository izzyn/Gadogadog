extends Node

var log : Array[Log_Entry]
var completed_events : Dictionary

@export
var possible_events : Array[Popup_Data]
var month_days = [31,28,31,30,31,30,31,31,30,31,30,31]

signal time_updated(day, month, year)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func append_log(event : Log_Entry) -> void:
	event.enact()
	log.append(event)
	get_tree().root.get_node("Map/CanvasLayer/Control/MarginContainer/HBoxContainer2/MarginContainer/PanelContainer/MarginContainer/HBoxContainer").update_bar()
	pass

func update_time():
	var day = CountryData.countries["world"].resources["day"].amount
	var month = CountryData.countries["world"].resources["month"].amount
	var year = CountryData.countries["world"].resources["year"].amount
	if month == 2 and year % 4 == 0 and day == 28:
		print("Leap day")
		CountryData.countries["world"].resources["day"].amount += 1
		return
	if day < month_days[month-1]:
		CountryData.countries["world"].resources["day"].amount += 1
	if day >= month_days[month-1]:
		CountryData.countries["world"].resources["day"].amount = 1
		CountryData.countries["world"].resources["month"].amount += 1
	if month >= 13:
		CountryData.countries["world"].resources["year"].amount += 1
		CountryData.countries["world"].resources["month"].amount = 1
	day = CountryData.countries["world"].resources["day"].amount
	month = CountryData.countries["world"].resources["month"].amount
	year = CountryData.countries["world"].resources["year"].amount
	for i in CountryData.countries:
		var newlog = Time_Update_Log.new()
		newlog.affected_country = i
		newlog.day = day
		newlog.month = month
		newlog.year = year
		append_log(newlog)
	time_updated.emit(day, month, year)
	pass

func display_time(days) -> String:
	if days > 365:
		return "[color=yellow]" + ("%.1f" % (float(days)/365.25)) + "[/color]" + " years"
	elif days > month_days[CountryData.countries["world"].resources["month"].amount - 1]:
		var t_days_left = days
		var current_month = CountryData.countries["world"].resources["month"].amount
		var months_left = 0
		while t_days_left >= Log.month_days[months_left+current_month-1]:
			t_days_left -= Log.month_days[months_left+current_month-1]
			months_left += 1
		return "[color=yellow]" + str(months_left) + "[/color]" + " months"
	else:
		return "[color=yellow]" + str(days) + "[/color]" + " days"
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
