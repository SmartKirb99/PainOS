extends Control

func _ready() -> void:
	RenderingServer.set_default_clear_color("#2a2a2a")
	$FileDialog.current_dir = "user://U/Pictures"


func _on_load_image_pressed() -> void:
	$FileDialog.popup()




func _on_file_dialog_file_selected(path: String) -> void:
	#print(path)
	
	var image = Image.new()
	image.load(path)
	
	var image_texture = ImageTexture.new()
	image_texture.set_image(image)
	
	$ColorRect/TextureRect.texture = image_texture
	
