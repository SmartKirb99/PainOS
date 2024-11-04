extends Area2D
var yPos : int
@onready var Maus = "/root/Node2D/Maus"


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.the_button_pressed.connect(_button_press_signal_check) # Replace with function body.
	Global.the_menu_has_been_exited.connect(_check_if_mouse_left)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_check_if_mouse_left()

#Checks to see if a signal is obtained from a button
func _button_press_signal_check():
	_move_screen(831)

#Moves the start menu "screen" to the specified Y Position
func _move_screen(yPos):
	var theLocation = create_tween()
	theLocation.tween_property(self, "position", Vector2(125, yPos),0.25)

func _check_if_mouse_left():
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			_move_screen(1500)
			Global.emit_signal("the_menu_has_been_left")
