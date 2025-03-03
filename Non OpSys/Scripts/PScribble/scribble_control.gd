extends Control
## Used to check if the thing being undone is a shape
const Undo_Mode_Shape = -2
## Used to check if the thing being undone is either eraser or pencil
const Undo_None = -1
## The modes for scribbling
enum BrushModes {
	Pencil,
	Eraser,
	Circle_Shape,
	Rectangle_Shape,
}
## The shapes for the brushes
enum BrushShapes {
	Rectangle,
	Circle,
}
##A list to hold all of the dictionaries that make up each brush
var brush_data_list = []
## Holds whether or not the mouse is inside the drawing area.
var is_mouse_in_drawing_area = false
##The mouse position from the last _process call
var last_mouse_position = Vector2()
##The position of the mouse when the left mouse button is pressed
var mouse_click_start_pos = null
##Used to tell if undo_elements_list_num is set
var undo_set = false
## Holds the size of the draw_elements_list before a new line is added, unless the brush mode is rectangle or circle
var undo_element_list_num = -1

## The brush mode
var brush_mode = BrushModes.Pencil
## The size of the brush
var brush_size = 32
## The color of the brush
var brush_color = Color.BLACK
## The shape of the brush
var brush_shape = BrushShapes.Circle
## The background color, and also the eraser color
var bg_color = Color.WHITE
## The uh- drawing area
@onready var drawing_area = $"../DrawingAreaBG"

##Pretty much runs the drawing app
func _process(delta):
	var mouse_pos = get_viewport().get_mouse_position()
	
	var drawing_area_rect := Rect2(drawing_area.position, drawing_area.size)
	is_mouse_in_drawing_area = drawing_area_rect.has_point(mouse_pos)
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if mouse_click_start_pos == null:
			mouse_click_start_pos = mouse_pos
			
			
		if check_if_mouse_is_inside_canvas():
			if mouse_pos.distance_to(last_mouse_position) >= 1:
				if brush_mode == BrushModes.Pencil or BrushModes.Eraser:
					
					if undo_set == false:
						undo_set = true
						undo_element_list_num = brush_data_list.size()
						
					add_brush(mouse_pos, brush_mode)
	else:
		undo_set = false
		
		if check_if_mouse_is_inside_canvas():
			if brush_mode == BrushModes.Circle_Shape or brush_mode == BrushModes.Rectangle_Shape:
				add_brush(mouse_pos, brush_mode)
				
				undo_element_list_num = Undo_Mode_Shape
				
		mouse_click_start_pos = null
##Checks if the mouse is inside the drawing area
func check_if_mouse_is_inside_canvas():
	if mouse_click_start_pos != null:
		if Rect2(drawing_area.position, drawing_area.size).has_point(mouse_click_start_pos):
			if is_mouse_in_drawing_area:
				return true
	return false


func undo_stroke():
	if undo_element_list_num == Undo_None:
		return
	if undo_element_list_num == Undo_Mode_Shape:
		if brush_data_list.size() > 0:
			brush_data_list.remove_at(brush_data_list.size() - 1)
			
		undo_element_list_num = Undo_None
		
	else:
		var elements_to_remove = brush_data_list.size() - undo_element_list_num
		
		for element_num in range(0, elements_to_remove):
			brush_data_list.pop_back()
			
	queue_redraw()

##Adds a new brush
func add_brush(mouse_pos, type):
	var new_brush = {}
	
	new_brush.brush_type = type
	new_brush.brush_position = mouse_pos
	new_brush.brush_shape = brush_shape
	new_brush.brush_size = brush_size
	new_brush.brush_color = brush_color
	
	
	if type == BrushModes.Rectangle_Shape:
		var TL_pos = Vector2()
		var BR_pos = Vector2()
		
		if mouse_pos.x < mouse_click_start_pos.x:
			TL_pos.x = mouse_pos.x
			BR_pos.x = mouse_click_start_pos.x
		else:
			TL_pos.x = mouse_click_start_pos.x
			BR_pos.x = mouse_pos.x
			
		if mouse_pos.y < mouse_click_start_pos.y:
			TL_pos.y = mouse_pos.y
			BR_pos.y = mouse_click_start_pos.y
		else:
			TL_pos.y = mouse_click_start_pos.y
			BR_pos.y = mouse_pos.y
			
		new_brush.brush_position = TL_pos
		new_brush.brush_shape_rect_pos_BR = BR_pos
	if type == BrushModes.Circle_Shape:
		
		var center_pos = Vector2((mouse_pos.x + mouse_click_start_pos.x) / 2, (mouse_pos.y + mouse_click_start_pos.y) / 2)
		new_brush.brush_position = center_pos
		new_brush.brush_shape_circle_radius = center_pos.distance_to(Vector2(center_pos.x, mouse_pos.y))
		
	brush_data_list.append(new_brush)
	queue_redraw()
	
func _draw():
	# Go through all of the brushes in brush_data_list.
	for brush in brush_data_list:
		match brush.brush_type:
			BrushModes.Pencil:
				# If the brush shape is a rectangle, then we need to make a Rect2 so we can use draw_rect.
				# Draw_rect draws a rectagle at the top left corner, using the scale for the size.
				# So we offset the position by half of the brush size so the rectangle's center is at mouse position.
				if brush.brush_shape == BrushShapes.Rectangle:
					var rect = Rect2(brush.brush_position - Vector2(brush.brush_size / 2, brush.brush_size / 2), Vector2(brush.brush_size, brush.brush_size))
					draw_rect(rect, brush.brush_color)
				# If the brush shape is a circle, then we draw a circle at the mouse position,
				# making the radius half of brush size (so the circle is brush size pixels in diameter).
				elif brush.brush_shape == BrushShapes.Circle:
					draw_circle(brush.brush_position, brush.brush_size / 2, brush.brush_color)
			BrushModes.Eraser:
				# NOTE: this is a really cheap way of erasing that isn't really erasing!
				# However, this gives similar results in a fairy simple way!

				# Erasing works exactly the same was as pencil does for both the rectangle shape and the circle shape,
				# but instead of using brush.brush_color, we instead use bg_color instead.
				if brush.brush_shape == BrushShapes.Rectangle:
					var rect = Rect2(brush.brush_position - Vector2(brush.brush_size / 2, brush.brush_size / 2), Vector2(brush.brush_size, brush.brush_size))
					draw_rect(rect, bg_color)
				elif brush.brush_shape == BrushShapes.Circle:
					draw_circle(brush.brush_position, brush.brush_size / 2, bg_color)
			BrushModes.Rectangle_Shape:
				# We make a Rect2 with the postion at the top left. To get the size we take the bottom right position
				# and subtract the top left corner's position.
				var rect = Rect2(brush.brush_position, brush.brush_shape_rect_pos_BR - brush.brush_position)
				draw_rect(rect, brush.brush_color)
			BrushModes.Circle_Shape:
				# We simply draw a circle using stored in brush.
				draw_circle(brush.brush_position, brush.brush_shape_circle_radius, brush.brush_color)


func save_picture(path):
	# Wait until the frame has finished before getting the texture.
	await RenderingServer.frame_post_draw

	# Get the viewport image.
	var img = get_viewport().get_texture().get_image()
	# Crop the image so we only have canvas area.
	var cropped_image = img.get_region(Rect2(drawing_area.position, drawing_area.size))

	# Save the image with the passed in path we got from the save dialog.
	cropped_image.save_png(path)
