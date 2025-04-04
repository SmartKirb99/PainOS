extends VideoStreamPlayer
##Peak Visuals
##
##A video player, what do you expect, VLC?

##The pause/play button
@onready var btn =$"../Pause"


##What was the snake that represents looping, but it doesn't like control filled settings, so it's a label
@onready var Cober = $"../Cober"
##Sets looping of the video to false
func _ready() -> void:
	loop = false
	$"../FileDialog".current_dir = "user://U/Movies"
##Pauses/Plays the video, togglable
func _on_pause_button_down() -> void:
	paused = !paused
	if paused:
		btn.text = "Play"
	else:
		btn.text = "Pause"

##When the loop button is pressed, toggles looping on or off
func _on_loop_button_down() -> void:
	print(loop)
	if loop:
		loop = false
	else:
		loop = true
	Cober.visible = !loop

##When the video is finished, if looping, replay the video
func _on_finished() -> void:
	if loop:
		play()

## Pops up a file dialog to select a video
func _on_open_file_pressed() -> void:
	$"../FileDialog".popup()

##Sets up the video
func _on_file_dialog_file_selected(path):
	stream.file = path
	play()
