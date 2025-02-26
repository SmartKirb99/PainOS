extends Area2D
## Mouse
##
## Essentially a simulated mouse

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position = get_viewport().get_mouse_position()
	

## Supposed to check if the mouse left the Start Menu area and clicked the mouse button, that didn't work
func _on_funny_start_menu_area_exited(area):
	Global.emit_signal("the_menu_has_been_exited") # Replace with function body.
