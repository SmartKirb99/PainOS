extends Control
## Login Stuff
##
## Handles everything located in the login screen

## The username
var username
## The password
var password
## The last guess that somebody put in
var last_guess
## Counts how many times the user has put in a wrong password
var counter : int
##The wallpaper
var wallpaper

## Called when the node enters the scene tree for the first time.
func _ready():
	_load_data_from_file("user://U/Settings/login.log")


## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

## Loads the data of a specified file
func _load_data_from_file(file_path: String):
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file:
		var data = file.get_as_text()
		file.close()
		
		_parse_login(data)
	else:
		print("File not found: ", file_path)

## Sets Username and Password to the values given in load_data_from_file
func _parse_login(data: String):
	
	var lines = data.split("\n")
	for line in lines:
		var parts = line.split(":")
		if parts.size() == 2:
			var key = parts[0].strip_edges()
			var value = parts[1].strip_edges()
			match key:
				"Username":
					username = value
				"Password":
					password = value
				"Last Guessed Password":
					last_guess = value

## Saves the values of username and password to the specified file
func _save_data_to_file(file_path: String):
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	if file:
		file.store_string("Username: %s\n" % username)
		file.store_string("Password: %s\n" % password)
		file.store_string("Last Guessed Password: %s\n" % last_guess)
		file.close()
	else:
		print("Failed to open file for writing: ", file_path)

## Checks if the text in the lineEdit node is the password, don't worry, the password cannot be seen as the lineEdit node has secret turned on, making the password just look like the Greek Letter Delta
func _on_line_edit_text_submitted(new_text):
	if $LineEdit.text == password:
		get_tree().change_scene_to_file("res://Non OpSys/Scenes/The UI I guess.tscn")
	else:
		last_guess = $LineEdit.text
		_save_data_to_file("user://U/Settings/login.log")
		counter = counter + 1
		$WrongGuesses/Label.text = str(counter)
		
func _save_data_to_login():
	_save_data_to_file("user://U/Settings/login.log")

##Basically makes it so the password is revealed when the checkbox is checked, and vice versa
func _on_check_box_pressed() -> void:
	if $CheckBox.button_pressed:
		$LineEdit.secret = false
	else:
		$LineEdit.secret = true
		
