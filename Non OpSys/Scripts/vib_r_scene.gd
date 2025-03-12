extends Control
## The most vibe music player ever
##
##Yeah this is just your basic music player, it can play songs and such

##Essentially, this keeps track of the current amount of time a song has been running for, in seconds
var time = 00

##This is used to check if the song is looping
var isLooping = false

## Prepares the scene by setting the background, and disables the loop button
func _ready() -> void:
	RenderingServer.set_default_clear_color("#2a2a2a")
	$Loop.disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_load_song_pressed() -> void:
	$FileDialog.popup()


func _on_file_dialog_file_selected(path: String) -> void:
	$AudioStreamPlayer.stream = load(path)
	$Loop.disabled = false
	$Timer.start()
	$AudioStreamPlayer.play()
	$LengthOfSong.text = "Length (Seconds): " +  str(int($AudioStreamPlayer.stream.get_length()))
	$Title.text = path.get_file()
	$LastingTimer.max_value = int($AudioStreamPlayer.stream.get_length())
	time = 0
	$Time.text = "Song Time (Seconds): " + str(time)
	$LastingTimer.value = 0

## Supposed to update the song time and the HScrollBar
func update_timer():
	if $AudioStreamPlayer.playing:
		time += 1
		$Time.text = "Song Time (Seconds): " + str(time)
		$LastingTimer.value += 1
	

##Basically if the song is looping, this will make it loop
func _on_audio_stream_player_finished() -> void:
	if isLooping:
		_reset_timer()
		$AudioStreamPlayer.play()
	else:
		pass

##Essentially when the button labeled Loop is pressed, it calls this function to loob the song
func _on_loop_pressed() -> void:
	if isLooping == true:
		isLooping = false
		$LoopCon.visible = false
		$LengthOfSong.text = "Length (Seconds): " +  str(int($AudioStreamPlayer.stream.get_length()))
	else:
		isLooping = true
		$LoopCon.visible = true
		$LengthOfSong.text = "Length (Seconds): " + str(int($AudioStreamPlayer.stream.get_length())) + " (Looping)"

##Pauses the stream
func _on_pause_pressed() -> void:
	$AudioStreamPlayer.stream_paused = true

##Plays the stream
func _on_play_pressed() -> void:
	$AudioStreamPlayer.stream_paused = false

##When the timer node times out
func _on_timer_timeout() -> void:
	update_timer()
	## Reset the song, in seconds, and the HScrollBar node. Really only used with looping on songs
func _reset_timer():
	time = 0
	$Time.text = "Song Time (Seconds): " + str(time)
	$LastingTimer.value = 0
