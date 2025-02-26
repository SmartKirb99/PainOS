extends Button
## Opens File Management
##
## Used to open File Management when the button is pressed

## Used to create the File Management Window
var window: Window
## Also used for help with the viewport
var viewport: Window
## Used to set the size of the window
var window_control: Control
## Ensures that when the button is pressed that it creates a window of File Management
func _ready():
	self.connect("pressed", Callable(self, "_on_button_press")) # Replace with function body.


## Makes sure that the window of File Management resizes to the window size
func _process(delta):
	if window != null:
		window_control.size = window.size

## Creates a new File Management Window to use File Management
func _on_button_press():
	#inWindow = true
	viewport = get_window()
	window = Window.new()
	window.borderless = false
	window.unresizable = false
	window.size = viewport.size * 0.25
	window.position = (viewport.size - window.size) * 0.5
	window.exclusive = false
	window.popup_window = true
	window.title = "File Management"
	window.visible = true
	window.transient = true
	window_control = Global.FileManagement.instantiate()
	window_control.position = Vector2i(0,0)
	window_control.size = window.size
	window.add_child(window_control)
	window.min_size = Vector2i(800, 360)
	window.max_size = Vector2i(1600, 900)
	window.close_requested.connect(func(): window.visible = false)
	viewport.add_child(window)
