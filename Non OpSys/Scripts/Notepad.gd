extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$"Open File".add_filter("*.txt ; Text File")
	$"Save File".add_filter("*.txt ; Text File")
	$"Save File".current_dir = "res://U/Documents"
	$"Open File".current_dir = "res://U/Documents"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	size = Global.window.size



func _on_open_button_pressed():
	$"Open File".current_dir = "res://U/Documents"
	$"Open File".popup()


func _on_save_button_pressed():
	$"Save File".current_dir = "res://U/Documents"
	$"Save File".popup()


func _on_save_file_file_selected(path):
	var filer = FileAccess.open(path, 2)
	filer.store_string($TextEdit.text)


func _on_open_file_file_selected(path):
	print(path)
	var filer = FileAccess.open(path, 1)
	$TextEdit.text = filer.get_as_text()
