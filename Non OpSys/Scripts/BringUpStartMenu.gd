extends Button



# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", Callable(self, "_on_Button_pressed")) # Replace with function body.
	self.visible = true
	Global.the_menu_has_been_left.connect(_no_more_start_menu)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Called when the button is pressed
func _on_Button_pressed():
	Global.emit_signal("the_button_pressed")
	self.visible = false

func _no_more_start_menu():
	self.visible = true
