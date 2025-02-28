extends Control
## File Manager
##
## This class handles everything located within the File Management Scene, seeing as it's basically crappy file explorer

## This variable essentially holds all the buttons related to folders and files
@onready var content = $ScrollContainer/GridContainer
## This variable handles everything within the pinned container
@onready var pinned = $"pinned or smth/VBoxContainer"
## This variable, is just the path
@onready var Npath = $path
##This String holds the path data
var path:String = ""
## This checks if a file is opened
var file :bool = false
## I believe this is used to check if something is limited
var limited = []
## This signal 
signal done(path:String)


## Sets the path to U (Being the equivalent of C:// in this OS, and pins all the essential files, like Documents
func _ready():
	path = "res://U/"
	set_layout()
	for i in FileGlobals.pinned:
		add_pinned_button(i)
		
##This creates a new button and adds it to the pinned section
func add_pinned_button(arr:Array):
	var nButton = Button.new()
	nButton.text = arr[0]
	pinned.add_child(nButton)
	nButton.pressed.connect(to_dir.bind(arr[1]))
	
## Sets the path to the new path
func to_dir(new_path:String):
	path = new_path
	set_layout()
## Opens the folder specified
func open_folder(folder_name:String):
	if file:
		path = path.get_base_dir()
	path = path + "/" + folder_name
	set_layout()
##Opens the file specified
func open_file(file_name:String):
	if file:
		path = path.get_base_dir()
	path = path + "/" + file_name
	Npath.text = path
	file = true
## Sets the layout, essentially just opening the path
func set_layout():
	file = false
	Npath.text = path
	for i in content.get_children(): i.queue_free()
	var dir = DirAccess.open(path)
	dir.list_dir_begin()
	var file_name = dir.get_next()
	while file_name != "":
		var nButton = Button.new()
		nButton.text = file_name
		content.add_child(nButton)
		if dir.current_is_dir():
			nButton.pressed.connect(open_folder.bind(file_name))
			nButton.add_theme_stylebox_override("normal", load("res://Non OpSys/Other Files/folder_box.tres"))
		else: 
			nButton.pressed.connect(open_file.bind(file_name))
			if limited.size() > 0:
				if !file_name.get_extension() in limited: nButton.queue_free()
		file_name = dir.get_next()



## Checks if the "UP" button is pressed. It's your exit button
func _on_up_pressed():
	if path.ends_with("res://U"): pass
	else:
		if file: path = path.get_base_dir()
		if !path.ends_with("res://U"): path = path.get_base_dir()
		set_layout()

## Checks when the path text is submitted
func _on_path_text_submitted(new_text:String):
	if new_text.is_absolute_path():
		if (new_text).begins_with("res://U"):
			path = new_text
			set_layout()
		else:
			Npath.clear
	else:
		Npath.clear()

## Currently does nothing, meant to open another window calling whatever app is best, like Notebook for text files
func _on_open_pressed():
	if path.ends_with(".txt"):
		if Global.inUI == true:
			Signals.file_opened = path
			Signals.call_notepad.emit()
			await get_tree().create_timer(1).timeout
			Signals.notepad_open_file.emit()
		else:
			print("Uhh, this does not appear to work within File Manager")

## Currently does nothing, unsure of what this is supposed to do
func _on_cancel_pressed():
	pass

## Pins the current folder
func _on_pin_pressed():
	var npath = path
	if file: npath = npath.get_base_dir()
	var name = npath.get_file()
	FileGlobals.pinned.append([name, npath])
	add_pinned_button([name, npath])
## Currently does nothing, meant to create a new folder that you can name
func _on_new_folder_pressed():
	pass
	
