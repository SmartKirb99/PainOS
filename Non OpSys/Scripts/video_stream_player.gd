extends VideoStreamPlayer

@onready var btn =$"../Pause"



@onready var Cober = $"../Cober"
func _ready() -> void:
	loop = false

func _on_pause_button_down() -> void:
	paused = !paused
	if paused:
		btn.text = "Play"
	else:
		btn.text = "Pause"


func _on_loop_button_down() -> void:
	print(loop)
	if loop:
		loop = false
	else:
		loop = true
	Cober.visible = !loop


func _on_finished() -> void:
	if loop:
		play()


func _on_open_file_pressed() -> void:
	$"../FileDialog".popup()


func _on_file_dialog_file_selected(path):
	stream.file = path
	play()
