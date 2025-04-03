extends Label
##Sets up the username for you
@onready var rtl = self
var username


##Sets the label to the username in the login screen
func _ready():
	_load_data_from_file("user://U/Settings/login.log")
	rtl.text = username


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _load_data_from_file(file_path: String):
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file:
		var data = file.get_as_text()
		file.close()
		
		_parse_login(data)
	else:
		print("File not found: ", file_path)
		
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
