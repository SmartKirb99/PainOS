extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", Callable(self, "_on_button_press")) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_press():
	Global.viewport = get_window()
	Global.popup = Popup.new()
	Global.popup.borderless = false
	Global.popup.unresizable = false
	Global.popup.size = Global.viewport.size * 0.25
	Global.popup.position = (Global.viewport.size - Global.popup.size) * 0.5
	Global.popup.exclusive = false
	Global.popup.popup_window = true
	Global.popup.name = "Notepad"
	Global.popup.visible = true
	Global.popup.transient = true
	Global.popup_control = Global.FunnyNotepad.instantiate()
	Global.popup_control.position = Vector2i(0,0)
	Global.popup_control.size = Global.popup.size
	Global.popup.add_child(Global.popup_control)
	Global.popup.close_requested.connect(func(): Global.popup.visible = false)
	Global.viewport.add_child(Global.popup)
