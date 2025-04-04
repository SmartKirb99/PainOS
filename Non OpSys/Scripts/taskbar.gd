extends HBoxContainer


var notepad



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_notebook_pressed() -> void:
	notepad = Button.new()
	notepad.icon = load("res://Non OpSys/Photos/Taskbar/notepad.png")
	notepad.size.x = 408
	notepad.size.y = 408
	notepad.scale.x = 0.2
	notepad.scale.y = 0.2
	add_child(notepad)
	print("Why")
