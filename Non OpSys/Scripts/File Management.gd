extends Control

@onready var content = $ScrollContainer/GridContainer
@onready var pinned = $"pinned or smth/VBoxContainer"
@onready var Npath = $path

var path:String = ""
var file :bool = false

var limited = []

signal done(path:String)


# Called when the node enters the scene tree for the first time.
func _ready():
	path = "res://U/Desktop"
	set_layout()
	for i in FileGlobals.pinned:
		add_pinned_button(i)

func add_pinned_button(arr:Array):
	var nButton = Button.new()
	nButton.text = arr[0]
	pinned.add_child(nButton)
	nButton.pressed.connect(to_dir.bind(arr[1]))
	
func to_dir(new_path:String):
	path = new_path
	set_layout()

func open_folder(folder_name:String):
	if file:
		path = path.get_base_dir()
	path = path + "/" + folder_name
	set_layout()

func open_file(file_name:String):
	if file:
		path = path.get_base_dir()
	path = path + "/" + file_name
	Npath.text = path
	file = true

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




func _on_up_pressed():
	if path.ends_with("res://U"): pass
	else:
		if file: path = path.get_base_dir()
		if !path.ends_with("res://U"): path = path.get_base_dir()
		set_layout()


func _on_path_text_submitted(new_text:String):
	if new_text.is_absolute_path():
		if (new_text).begins_with("res://U"):
			path = new_text
			set_layout()
		else:
			Npath.clear
	else:
		Npath.clear()


func _on_open_pressed():
	pass


func _on_cancel_pressed():
	pass


func _on_pin_pressed():
	var npath = path
	if file: npath = npath.get_base_dir()
	var name = npath.get_file()
	FileGlobals.pinned.append([name, npath])
	add_pinned_button([name, npath])

func _on_new_folder_pressed():
	pass
