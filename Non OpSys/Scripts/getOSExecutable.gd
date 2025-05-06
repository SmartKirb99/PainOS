extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var basic = OS.get_executable_path()
	var file = FileAccess.open("user://U/Documents/OS.txt",2)
	file.store_string(basic)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
