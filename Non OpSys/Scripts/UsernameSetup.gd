extends Label
@onready var rtl = self


# Called when the node enters the scene tree for the first time.
func _ready():
	rtl.text = LoginScreen.username


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
