extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.inUI = true
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_signaling_change_background() -> void:
	$PlaceholderBackground.texture = Global.wallpaper


func _on_button_pressed() -> void:
	$FileDialog.popup()


func _on_file_dialog_file_selected(path: String) -> void:
	$PlaceholderBackground.texture = load(path)
