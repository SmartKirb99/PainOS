extends Button
##Peak Video Stuff
##
##Opens Up Video Player, a... video player... yeah I couldn't come up with a unique name for this

## A window
var window: Window
## A viewport
var viewport: Window
## Used to ensure the scene is instantiated
var window_control: Control
## The button on the taskbar
@onready var task: Button = $"../../Taskbar/VideoPlayer"


##Allows the button to open up the video player
func _ready():
	self.connect("pressed", Callable(self, "_on_button_press")) # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

## Creates a new window meant for the Video Player Application, and moves the taskbar button up. Also disables video player from being able to be opened when it's open
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
	window.title = "Video Player"
	window.visible = true
	window.transient = true
	window_control = Global.MoviePlayer.instantiate()
	window.add_child(window_control)
	window.min_size = Vector2i(1600, 900)
	window.max_size = Vector2i(1920, 1080)
	window.close_requested.connect(func(): window.queue_free(); self.disabled = false; self.text = "Video Player"; task.position.y = 114)
	viewport.add_child(window)
	self.disabled = true
	self.text = self.text + " - Open"
	tween.tween_property(task, "position", Vector2(408, 31), 0.5)
	task.pressed.connect(func(): window.grab_focus())
