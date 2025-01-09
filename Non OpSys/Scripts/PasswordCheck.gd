extends LineEdit
var password
## Called when the node enters the scene tree for the first time.
func _ready():
	LoginScreen._load_data_from_file("res://User Data/User.painoperatingsystemlogin") # Replace with function body.
	print("Something")


## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_getPassword()
## gets the password
func _getPassword():
	if Input.is_action_just_released("Input"):
		if self.text == LoginScreen.password:
			get_tree().change_scene_to_file("res://Non OpSys/Scenes/The UI I guess.tscn")
		elif self.text != LoginScreen.password:
			_warn_password()
			LoginScreen.last_guess = self.text
			LoginScreen._save_data_to_file("res://User Data/User.painoperatingsystemlogin")

## Warns when password is incorrect
func _warn_password():
	Global.viewport = get_window()
	Global.window = Window.new()
	Global.window.borderless = false
	Global.window.unresizable = true
	Global.window.size = Global.viewport.size * 0.25
	Global.window.position = (Global.viewport.size - Global.window.size) * 0.5
	Global.window.exclusive = false
	Global.window.window_window = false
	Global.window.name = "Invalid"
	Global.window.visible = true
	Global.window.transient = true
	Global.window_control = Global.PopUpScene.instantiate()
	Global.window_control.position = Vector2i(0,0)
	Global.window_control.size = Global.window.size
	Global.window.add_child(Global.window_control)
	Global.window.close_requested.connect(func(): Global.window.visible = false)
	Global.viewport.add_child(Global.window)
