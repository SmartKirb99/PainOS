extends Node2D

var wallpaper

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	getLoginData()
	Global.inUI = true
	if wallpaper == null:
		print("nil")
	else:
		$PlaceholderBackground.texture = load(wallpaper)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_signaling_change_background() -> void:
	$PlaceholderBackground.texture = Global.wallpaper


func _on_button_pressed() -> void:
	$FileDialog.popup()


func _on_file_dialog_file_selected(path: String) -> void:
	#print(path)
	wallpaper = path
	$PlaceholderBackground.texture = load(path)
	_save_settings()
	
	
func getLoginData():
	var file = FileAccess.open("res://User Data/Setting.painoperatingsystemsettings", FileAccess.READ)
	if file:
		var data = file.get_as_text()
		file.close()
		_parse_login(data)
	else:
		print("There's no login file")

## Sets Username and Password to the values given in load_data_from_file
func _parse_login(data: String):
	var lines = data.split("\n")
	for line in lines:
		var parts = line.split(";")
		if parts.size() == 2:
			var key = parts[0].strip_edges()
			var value = parts[1].strip_edges()
			match key:
				"Background Link":
					if !value.contains("res://"):
						wallpaper = null
					else:
						wallpaper = value

func _save_settings():
	var file = FileAccess.open("res://User Data/Setting.painoperatingsystemsettings", FileAccess.WRITE)
	if file:
		file.store_string("Background Link; %s\n" % wallpaper)
		#file.store_string("Username: %s\n" % username)
		#file.store_string("Password: %s\n" % password)
		#file.store_string("Last Guessed Password: %s\n" % last_guess)
		file.close()
	else:
		print("Failed to open file for writing: ", "res://User Data/Setting.painoperatingsystemsettings")
