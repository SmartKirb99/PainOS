extends Control

@onready var passwordd = $Password
@onready var confirmation = $Confirmation
@onready var confirmer = $PasswordRealizer
@onready var setup = $Setup
@onready var user = $User
@onready var username
@onready var last_guess = null
@onready var password

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_login()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if passwordd.text == "" and confirmation.text == "":
		confirmer.text = "You currently don't have a password"
		setup.disabled = true
	elif passwordd.text == "" and confirmation.text != "":
		confirmer.text = "Your password is in the confirmation box"
		setup.disabled = true
	elif passwordd.text == confirmation.text:
		if user.text != "":
			confirmer.text = "Ok, your password is good"
			setup.disabled = false
		else:
			confirmer.text = "Uh, you still need to fill out the username box"
			setup.disabled = true
	elif passwordd.text != "" and confirmation.text == "":
		confirmer.text = "Alright, now confirm your password"
		setup.disabled = true
	else:
		confirmer.text = "Uh, different password 💀"
		setup.disabled = true


func _on_check_box_pressed() -> void:
	if $CheckBox.button_pressed:
		$Password.secret = false
		$Confirmation.secret = false
	else:
		$Password.secret = true
		$Confirmation.secret = true


func _on_setup_pressed() -> void:
	_save_data_to_file("user://U/Settings/login.log")
	
	
func create_login():
	var login_file = "user://U/Settings/login.log"
	var access = FileAccess.open(login_file, FileAccess.WRITE)
	
func _save_data_to_file(file_path: String):
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	if file:
		file.store_string("Username: %s\n" % user.text)
		file.store_string("Password: %s\n" % passwordd.text)
		file.store_string("Last Guessed Password: %s\n" % last_guess)
		file.close()
	else:
		print("Failed to open file for writing: ", file_path)
