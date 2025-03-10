extends AnimatedSprite2D
##Patience sir, or ma'am, or whatever the formal term for your gender is, or what you prefer


# Called when the node enters the scene tree for the first time.
func _ready():
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
	get_tree().change_scene_to_file("res://Non OpSys/Scenes/Login.tscn")
