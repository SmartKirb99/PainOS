extends Button
## Shut Down
##
## Basically used to close the operating system

## Used to make sure that when this button is pressed that the OS closes
func _ready():
	self.connect("pressed", Callable(self, "_on_button_press")) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

## Closes the OS, essentially shutting down the computer
func _on_button_press():
	get_tree().quit()
