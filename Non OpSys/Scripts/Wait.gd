extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	patience() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#Makes the user wait 10 seconds until the program is ready, and sends the user to the login screen
func patience():
	print("Pain OS is starting!")
	await get_tree().create_timer(10.0).timeout
	print("Pain OS is ready!")
	get_tree().change_scene_to_file("res://Non OpSys/Scenes/Login.tscn")

