@tool
extends CollisionPolygon2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	polygon = get_parent().get_parent().polygon
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
