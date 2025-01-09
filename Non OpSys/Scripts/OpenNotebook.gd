extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", Callable(self, "_on_button_press")) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_press():
	Global.viewport = get_window()
	Global.window = Window.new()
	Global.window.borderless = false
	Global.window.unresizable = false
	Global.window.size = Global.viewport.size * 0.25
	Global.window.position = (Global.viewport.size - Global.window.size) * 0.5
	Global.window.exclusive = false
	Global.window.popup_window = true
	Global.window.title = "Notebook"
	Global.window.visible = true
	Global.window.transient = true
	Global.window_control = Global.FunnyNotepad.instantiate()
	Global.window_control.position = Vector2i(0,0)
	Global.window_control.size = Global.window.size
	Global.window.add_child(Global.window_control)
	Global.window.min_size = Vector2i(300, 300)
	Global.window.max_size = Vector2i(1000, 700)
	Global.window.close_requested.connect(func(): Global.window.visible = false)
	Global.viewport.add_child(Global.window)
