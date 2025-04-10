extends Node2D
## The script stuff primarily for the wallpaper


##The wallpaper
var wallpaper


## Sets up the wallpaper
func _ready() -> void:
	getLoginData()
	var photo = Image.new()
	if !wallpaper == null:
		var err = photo.load(wallpaper)
		if err!= OK:
			print("File not loaded: ",err)
	var texture = ImageTexture.create_from_image(photo)
	Global.inUI = true
	if wallpaper == null:
		print("nil")
	else:
		$PlaceholderBackground.texture = texture
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

##Changes the background
func _on_signaling_change_background() -> void:
	$PlaceholderBackground.texture = Global.wallpaper

##Opens up the background changer
func _on_button_pressed() -> void:
	$FileDialog.popup()

## Used to change the background
func _on_file_dialog_file_selected(path: String) -> void:
	#print(path)
	wallpaper = path
	var photo = Image.new()
	var err = photo.load(path)
	if err!= OK:
		print("File not loaded: ",err)
	var texture = ImageTexture.create_from_image(photo)
	$PlaceholderBackground.texture = texture
	_save_settings()
	
	##Gets the settings
func getLoginData():
	var file = FileAccess.open("user://U/Settings/settings.log", FileAccess.READ)
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
						if !value.contains("user://"):
							wallpaper = null
						else:
							wallpaper = value
					else:
						wallpaper = value
##Saves the settings
func _save_settings():
	var file = FileAccess.open("user://U/Settings/settings.log", FileAccess.WRITE)
	if file:
		file.store_string("Background Link; %s\n" % wallpaper)
		#file.store_string("Username: %s\n" % username)
		#file.store_string("Password: %s\n" % password)
		#file.store_string("Last Guessed Password: %s\n" % last_guess)
		file.close()
	else:
		print("Failed to open file for writing: ", "user://U/Settings/settings.log")
