extends Control
## I love GDColode
##
## Yeah, for whatever reason, I decided the code editor should reference GDColon

@export var open_this : Resource = preload("res://Non OpSys/Scripts/gdColode/open_this.gd")
var open = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_open_folder_pressed() -> void:
	$FileDialog.popup()


func _on_file_dialog_dir_selected(dir: String) -> void:
	for i in $ScrollContainer/VBoxContainer.get_child_count():
		$ScrollContainer/VBoxContainer.get_child(i).queue_free()
	for i in DirAccess.get_files_at(dir):
		if i.get_extension() == "uid":
			pass
		elif i.get_extension() == "gd":
			var button = Button.new()
			$ScrollContainer/VBoxContainer.add_child(button)
			button.text = i.get_file()
			button.set_script(open_this)
			print(button.get_script())
			button.test()
			button.path = dir + "/" + i
			print("This creates a new button node, it should soon be able to open up the file")
		else: pass
		
		
