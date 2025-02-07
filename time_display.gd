extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Log.time_updated.connect(update_timer)
	pass # Replace with function body.

func update_timer(day):
	var time = Log.get_calendar(day)
	text = str(time[0]) + "/" + str(time[1]) + "/" + str(time[2])
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
