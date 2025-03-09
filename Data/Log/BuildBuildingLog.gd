extends Log_Entry
class_name Build_Building_Log

@export
var region : String

@export
var building_id : String

@export
var amount : int

func enact():
	if building_id in Log.regions[region].buildings.keys():
		Log.regions[region].buildings[building_id] += amount
	elif amount > 0:
		Log.regions[region].buildings[building_id] = amount
	UiManager.update_ui.emit()
	pass
	
func revoke():
	if building_id in Log.regions[region].buildings.keys():
		Log.regions[region].buildings[building_id] -= amount
	elif amount < 0:
		Log.regions[region].buildings[building_id] = -amount
	
	if Log.regions[region].buildings[building_id] == 0:
		Log.regions[region].buildings.erase(building_id)
	UiManager.update_ui.emit()
	pass

func get_tooltip() -> String:
	return ""
	pass
