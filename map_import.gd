extends Button

var regions_bitmap : Array
var queued_pixels : Array[Vector2i]
var queued_region_pixels : Array[Vector2i]
var queued_color_pixels : Array[Color]
var polygon_starts : Array[Vector2i]
var current_color
var current_region
var file : Image

var progress = 0
var progress_text = ""
var processing = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("pressed", pressed)
	
	pass # Replace with function body.

func pressed():
	var thread = Thread.new()
	progress = 0
	processing = true
	progress_text = ""
	var import_path = get_parent().get_node("HBoxContainer/LineEdit").text
	file = Image.load_from_file(import_path)
	var texture = ImageTexture.create_from_image(file)
	get_parent().get_parent().get_node("VBoxContainer2/TextureRect").texture = texture
	thread.start(export_image.bind(import_path))
	var bar = get_parent().get_node("ProgressBar")
	pass

func export_image(import_path):
	
	file = Image.load_from_file(import_path)
	var texture = ImageTexture.create_from_image(file)
	regions_bitmap.clear()
	queued_pixels.clear()
	queued_region_pixels.clear()
	queued_color_pixels.clear()
	polygon_starts.clear()
	current_color = null
	current_region = 1
	var found_color : bool
	var first_pixel
	for x in file.get_width():
		regions_bitmap.append([])
		for y in file.get_height():
			regions_bitmap[x].append(0)
			var color = file.get_pixel(x,y)
			if color != Color.WHITE and !found_color:
				found_color = true
				first_pixel = Vector2i(x,y)
				queued_pixels.append(Vector2i(x,y))
				current_color = file.get_pixel(x, y)
	
	
	while true:
		progress_text = "Detecting regions (this may take a while)"
		if len(queued_pixels) == 0:
			var next_pixel = queued_region_pixels.pop_front()
			if !next_pixel:
				break
			print(len(regions_bitmap))
			if regions_bitmap[next_pixel.x][next_pixel.y] == 0:
				polygon_starts.append(next_pixel)
				current_color = file.get_pixel(next_pixel.x, next_pixel.y)
				queued_color_pixels.clear()
				queued_pixels.append(next_pixel)
				current_region += 1
		
		if len(queued_pixels) == 0:
			if len(queued_region_pixels) == 0:
				break
			else:
				continue
		var current_pixel = queued_pixels.pop_front()
		regions_bitmap[current_pixel.x][current_pixel.y] = current_region
		if file.get_width() > current_pixel.x: checkpixel(current_pixel.x+1, current_pixel.y)
		if current_pixel.x != 0: checkpixel(current_pixel.x-1, current_pixel.y)
		if file.get_height() > current_pixel.y: checkpixel(current_pixel.x, current_pixel.y+1)
		if current_pixel.y != 0: checkpixel(current_pixel.x, current_pixel.y-1)
	
	var quadrant 
	var check_region = regions_bitmap[first_pixel.x][first_pixel.y]
	var completed_regions = []
	var changed_regions = true
	var polygons = []
	var current_polygon = []
	var offset_x = 0
	var offset_y = 0
	var direction_x = 0
	var direction_y = 0
	var previous_dir_x = 0
	var previous_dir_y = 0
	var total_polygons = len(polygon_starts)+1
	while true:
		progress_text = "Baking polygon %s/%s" % [len(polygons)+1, total_polygons]
		previous_dir_x = direction_x
		previous_dir_y = direction_y
		var colour_difference = 0
		var total_colours = 0
		var region_hash = {}
		if changed_regions:
			if first_pixel.x == 0 or regions_bitmap[first_pixel.x-1][first_pixel.y] != check_region:
				quadrant = [first_pixel, Vector2i(first_pixel.x - 1, first_pixel.y), Vector2i(first_pixel.x, first_pixel.y - 1), Vector2i(first_pixel.x - 1, first_pixel.y - 1)]
				direction_y = 1
			elif len(regions_bitmap) <= first_pixel.x or regions_bitmap[first_pixel.x+1][first_pixel.y] != check_region:
				quadrant = [first_pixel, Vector2i(first_pixel.x + 1, first_pixel.y), Vector2i(first_pixel.x, first_pixel.y + 1), Vector2i(first_pixel.x + 1, first_pixel.y + 1)]
				direction_y = -1
			elif first_pixel.y == 0 or regions_bitmap[first_pixel.x][first_pixel.y - 1] != check_region:
				quadrant = [first_pixel, Vector2i(first_pixel.x +1, first_pixel.y - 1), Vector2i(first_pixel.x + 1, first_pixel.y), Vector2i(first_pixel.x, first_pixel.y - 1)]
				direction_x = -1
			elif len(regions_bitmap[first_pixel.x]) <= first_pixel.y or regions_bitmap[first_pixel][first_pixel+1] != check_region:
				quadrant = [first_pixel, Vector2i(first_pixel.x - 1, first_pixel.y + 1), Vector2i(first_pixel.x-1, first_pixel.y), Vector2i(first_pixel.x, first_pixel.y + 1)]
				direction_x = 1
		for i in quadrant:
			var actual_x = i.x + offset_x
			var actual_y = i.y + offset_y
			
			if len(regions_bitmap) <= actual_x:
				colour_difference += 1
				continue
			if actual_x < 0:
				colour_difference += 1
				continue
			if len(regions_bitmap[actual_x]) <= actual_y:
				colour_difference += 1
				continue
			if actual_y < 0:
				colour_difference += 1
				continue  
			region_hash[regions_bitmap[actual_x][actual_y]] = Vector2i(actual_x, actual_y)
			if regions_bitmap[actual_x][actual_y] != check_region:
				colour_difference += 1
		
		if !changed_regions:
			var inverted = -1
			if colour_difference == 3:
				inverted = 1
			if colour_difference == 3 or colour_difference == 1:
				if direction_x:
					direction_y = -direction_x * inverted
					direction_x = 0
				elif direction_y:
					direction_x = direction_y * inverted
					direction_y = 0
		
		
		
		var x_coord = 0.0
		var y_coord = 0.0
		
		if colour_difference == 3 or colour_difference == 1:
			for i in quadrant: 
				x_coord += i.x + offset_x
				y_coord += i.y + offset_y
			x_coord = float(x_coord)/4
			y_coord = float(y_coord)/4
			if len(region_hash.keys()) == 2 and (previous_dir_x != 0 or previous_dir_y != 0):
				var first_poly = Vector2(x_coord-float(previous_dir_x)/2, y_coord-float(previous_dir_y)/2)
				if len(current_polygon) == 0 or !current_polygon[len(current_polygon) - 1] == first_poly:
					current_polygon.append(first_poly)
				x_coord += float(direction_x)/2
				y_coord += float(direction_y)/2

			if !changed_regions and offset_x == 0 and offset_y == 0:
				polygons.append(current_polygon.duplicate())
				current_polygon = []
				changed_regions = true
				if len(polygon_starts) == 0:
					break
				else:
					first_pixel = polygon_starts.pop_back()
					check_region = regions_bitmap[first_pixel.x][first_pixel.y]
					direction_x = 0
					direction_y = 0
					offset_x = 0
					offset_y = 0
					continue
			else:
				if len(current_polygon) == 0 or !current_polygon[len(current_polygon) - 1] == Vector2(x_coord, y_coord):
					current_polygon.append(Vector2(x_coord, y_coord))
			if len(current_polygon) >= 3:
				var dy1 =  abs(current_polygon[len(current_polygon)-1].y - current_polygon[len(current_polygon)-2].y)
				var dy2 = abs(current_polygon[len(current_polygon)-1].y - current_polygon[len(current_polygon)-3].y)
				var dx1 = abs(current_polygon[len(current_polygon)-1].x - current_polygon[len(current_polygon)-2].x)
				var dx2 = abs(current_polygon[len(current_polygon)-1].x - current_polygon[len(current_polygon)-3].x)
				if dy1/dx1 == dy2/dx2:
					current_polygon.remove_at(len(current_polygon) - 2)
		changed_regions = false
		offset_x += direction_x
		offset_y += direction_y
	
	print("cleaning up")
	

	var map = load("res://regions.tscn").instantiate()
	var index = 1
	for i in polygons:
		progress_text = "Creating polygon %s out of %s" % [index, len(polygons)]
		index += 1
		print("Creationg region...tes")
		var region = load("res://Map/Region.tscn").instantiate()
		region.polygon = i.duplicate()
		map.add_child(region)
		region.set_owner(map)
	var scene = PackedScene.new()
	scene.pack(map)
	progress_text = "Saving..."
	ResourceSaver.save(scene, "res://%s_exported.tscn" % import_path.split(".")[0])
	processing = false 
	pass
func checkpixel(x,y):
	
	if regions_bitmap[x][y] == 0 and Vector2i(x,y) not in queued_pixels:
		var check_color = file.get_pixel(x,y)
		if check_color == Color.WHITE: return
		if current_color == check_color:
			queued_pixels.append(Vector2i(x,y))
		elif check_color not in queued_color_pixels:
			queued_color_pixels.append(check_color)
			queued_region_pixels.append(Vector2i(x,y))
			
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if processing:
		get_parent().get_node("Label").text = progress_text
	
	pass
