extends Button

@onready var code_edit: CodeEdit = %CodeEdit

var path

# Called when the node enters the scene tree for the first time.
func test():
	print("this might run")
	self.connect("pressed", Callable(self, "on_button_press"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

##When the button is pressed
func on_button_press():
	print("Hi :D")
	open_file()
	

func open_file():
	var file = FileAccess.open(path, FileAccess.READ_WRITE)
	code_edit.text = file.get_as_text()
	print(path)
