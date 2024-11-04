extends LineEdit
var password
## Called when the node enters the scene tree for the first time.
func _ready():
	LoginScreen._load_data_from_file("res://User Data/User.poslogin") # Replace with function body.
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
			LoginScreen._save_data_to_file("res://User Data/User.poslogin")

## Warns when password is incorrect
func _warn_password():
	Global.viewport = get_window()
	Global.popup = Popup.new()
	Global.popup.borderless = false
	Global.popup.unresizable = false
	Global.popup.size = Global.viewport.size * 0.25
	Global.popup.position = (Global.viewport.size - Global.popup.size) * 0.5
	Global.popup.exclusive = false
	Global.popup.popup_window = false
	Global.popup.name = "Invalid"
	Global.popup.visible = true
	Global.popup.transient = true
	Global.popup_control = Global.PopUpScene.instantiate()
	Global.popup_control.position = Vector2i(0,0)
	Global.popup_control.size = Global.popup.size
	Global.popup.add_child(Global.popup_control)
	Global.popup.close_requested.connect(func(): Global.popup.visible = false)
	Global.viewport.add_child(Global.popup)
