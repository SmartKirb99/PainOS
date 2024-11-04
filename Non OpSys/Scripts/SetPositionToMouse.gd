extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position = get_viewport().get_mouse_position()
	


func _on_funny_start_menu_area_exited(area):
	Global.emit_signal("the_menu_has_been_exited") # Replace with function body.
