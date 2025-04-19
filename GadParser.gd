extends Node


func _ready() -> void:
	parse("
	#This is a comment
	this is some text
	this is soome text #next to a comment
	#this is a comment at the enf of a file")
	pass
	
func parse(input : String):
	
	var parse_string = input
	
	while parse_string.find("#") != -1:
		var start_idx = parse_string.find("#")
		var end_idx = start_idx
		while true:
			end_idx += 1
			if parse_string[end_idx] == "\n" or end_idx == parse_string.length() - 1:
				break
			for i in range(end_idx - start_idx):
				parse_string.erase(start_idx)
		print(parse_string)
	pass
