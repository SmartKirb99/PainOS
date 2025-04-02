extends AnimatedSprite2D
##Patience sir, or ma'am, or whatever the formal term for your gender is, or what you prefer


# Called when the node enters the scene tree for the first time.
func _ready():
	create_root_folder("U")
	create_subfolder("Documents")
	create_subfolder("Code")
	create_subfolder("Downloads")
	create_subfolder("Movies")
	create_subfolder("Music")
	create_subfolder("Pictures")
	create_subfolder("Settings")
	patience() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

##Makes the user wait 10 seconds until the program is "ready", and sends the user to the login screen
func patience():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	print("Pain OS is starting!")
	await get_tree().create_timer(10.0).timeout
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	print("Pain OS is ready!")
	if (FileAccess.file_exists("user://U/Settings/login.log")):
		get_tree().change_scene_to_file("res://Non OpSys/Scenes/Login.tscn")
	else:
		get_tree().change_scene_to_file("res://Non OpSys/Scenes/loginsetup.tscn")
	
func create_root_folder(folder_path):
	var directory = DirAccess.open("user://")
	var full_path = "user://" + folder_path
	if not directory:
		print("Uh meow 💀")
		return
	if DirAccess.dir_exists_absolute(full_path):
		print("💀 Oh hey, your root folder exists here: " + full_path)
		return
	var error_code = DirAccess.make_dir_recursive_absolute(full_path)
	if error_code != OK:
		print("💀 Some error caused an issue with making the root folder here: " + full_path + ", error code: " + str(error_code))
	else:
		print("Okay, your root folder has been created")
		
func create_subfolder(folder_path):
	var directory = DirAccess.open("user://U/")
	var full_path = "user://U/" + folder_path
	if not directory:
		print("💀 ⊙﹏⊙∥")
		return
	if DirAccess.dir_exists_absolute(full_path):
		print("💀 This was likely already added here: " + full_path)
		return
	var error_code = DirAccess.make_dir_recursive_absolute(full_path)
	if error_code != OK:
		print("💀 An error occured （；´д｀）ゞ : " + full_path + ", error code: " + str(error_code))
	else:
		print("Your new OS folder is now ready []~￣▽￣)~* with this path: " + full_path)
