extends Button
## Opens Notebook
##
## Opens the Notebook application in a new window

## Used to create the Notebook window
var window: Window
## Used in tandem with the window to make the scene fit
var viewport: Window
## Used to instantiate the scene in the window
var window_control: Control

@onready var task = $"../../Taskbar/Notepad"




##  Connects the _onButtonPress script to the button to make sure that the window gets created
func _ready():
	self.connect("pressed", Callable(self, "_on_button_press")) # Replace with function body.
	Signals.connect("call_notepad", Callable(self, "_on_button_press"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
## Creates a new window
func _on_button_press():
	var tween = task.create_tween()
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
	window.close_requested.connect(func(): window.visible = false; self.disabled = false; self.text = "Notebook"; task.position = Vector2(0,114))
	viewport.add_child(window)
	self.disabled = true
	self.text = self.text + " - Open"
	tween.tween_property(task, "position", Vector2(0, 31), 0.5)
	
## Gets the window parameters
func get_window_params():
	viewport.get_window()
	return window.size


func _on_signaling_call_notepad() -> void:
	_on_button_press()
