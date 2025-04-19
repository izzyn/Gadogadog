extends Button

var entries : Array[Selection_Log]
var tooltip : String

@export
var auto_select_after : int = -1

var time_created : int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Log.time_updated.connect(check_time)
	if tooltip != "":
		connect("mouse_entered", _mouse_entered)
		connect("mouse_exited", _mouse_exited)
	pass # Replace with function body.

func _pressed() -> void:
	for i in entries:
		for country in i ._exported:
			for log in i.logs:
				var log_dupe : Log_Entry = log.duplicate()
				log_dupe.affected_country = country
				Log.append_log(log_dupe)
	get_parent().get_parent().get_parent().get_parent().queue_free()
	pass

func check_time(day):
	if auto_select_after != -1 and auto_select_after + time_created <= day:
		_pressed()
	pass

func _mouse_entered():
	UiManager.create_tooltip(tooltip)
	pass

func _mouse_exited():
	UiManager.hide_tooltip()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
