extends Button

var speed = 1
@export
var max_speed = 4
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	speed += 1
	speed = speed % max_speed
	TimeManager.speed = speed
	text = str(speed)
	TimeManager.restart_timer()
	pass # Replace with function body.
