extends Control
## Notepad
##
## The notebook application. Controls everything needed to make notebook work properly, yes it's internally called Notepad 

## Makes sure that the open file, and save file, file dialogs (Those windows that pop up when clicking save as file or open file), start with a filter of .txt, making the primary file it saves be text files. And sets the current directory to documents
func _ready():
	$"Open File".add_filter("*.txt ; Text File")
	$"Save File".add_filter("*.txt ; Text File")
	$"Save File".current_dir = "res://U/Documents"
	$"Open File".current_dir = "res://U/Documents"
	Signals.notepad_open_file.connect(Callable(self, "_on_signalling_notepad_open_file"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#size = Global.window.size
	pass


## Checks when the button labeled "Open File" is pressed
func _on_open_button_pressed():
	$"Open File".current_dir = "res://U/Documents"
	$"Open File".popup()

## Checks when the button labeled "Save As File" is pressed
func _on_save_button_pressed():
	$"Save File".current_dir = "res://U/Documents"
	$"Save File".popup()

## Used to save files
func _on_save_file_file_selected(path):
	var filer = FileAccess.open(path, 2)
	filer.store_string($TextEdit.text)

## Used to open files
func _on_open_file_file_selected(path):
	print(path)
	var filer = FileAccess.open(path, 1)
	$TextEdit.text = filer.get_as_text()


func _on_signaling_notepad_open_file():
	print("Did this work")
