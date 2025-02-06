extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Log.time_updated.connect(update_timer)
	pass # Replace with function body.

func update_timer(day, month, year):
	text = str(day) + "/" + str(month) + "/" + str(year)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
