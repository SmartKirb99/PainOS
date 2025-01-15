extends Button
var window: Window
var viewport: Window
var window_control: Control
# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", Callable(self, "_on_button_press")) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_press():
	viewport = get_window()
	window = Window.new()
	window.borderless = false
	window.unresizable = false
	window.size = viewport.size * 0.25
	window.position = (viewport.size - window.size) * 0.5
	window.exclusive = false
	window.popup_window = true
	window.title = "Notebook"
	window.visible = true
	window.transient = true
	window_control = Global.FunnyNotepad.instantiate()
	window.add_child(window_control)
	window.min_size = Vector2i(640, 360)
	window.max_size = Vector2i(1600, 900)
	window.close_requested.connect(func(): window.visible = false)
	viewport.add_child(window)

func get_window_params():
	viewport.get_window()
	return window.size
