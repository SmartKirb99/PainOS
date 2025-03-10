extends Label
##Sets up the username for you
@onready var rtl = self


##Sets the label to the username in the login screen
func _ready():
	rtl.text = LoginScreen.username


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
