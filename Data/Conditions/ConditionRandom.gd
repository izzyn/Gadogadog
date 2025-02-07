extends Condition
class_name Condition_Random

@export_range(0,1.0)
var chance : float
func check():
	var rng = RandomNumberGenerator.new()
	rng.seed = Log.world_seed + Log.current_day
	var number = rng.randf()
	
	if chance >= number:
		return true
	else:
		return false
	pass
