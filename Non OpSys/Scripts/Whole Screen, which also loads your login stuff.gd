extends Control
var username
var password
var last_guess

## Called when the node enters the scene tree for the first time.
func _ready():
	_load_data_from_file("res://User Data/User.poslogin")


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
