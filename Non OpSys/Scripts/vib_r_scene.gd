extends Control

var time = 00
var timerRunning = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	RenderingServer.set_default_clear_color("#2a2a2a")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_tree().create_timer(1).timeout
	
	

func _on_load_song_pressed() -> void:
	$FileDialog.popup()


func _on_file_dialog_file_selected(path: String) -> void:
	$AudioStreamPlayer.stream = load(path)
	$AudioStreamPlayer.play()
	$LengthOfSong.text = "Length (Seconds):" +  str(int($AudioStreamPlayer.stream.get_length()))
	$Title.text = path.get_file()
	$LastingTimer.max_value = int($AudioStreamPlayer.stream.get_length())
	time = 0
	$LastingTimer.value = 0


func update_timer():
	if $AudioStreamPlayer.playing:
		$Time.text = "Song Time (Seconds): " + str(time)
		time += 1
		$LastingTimer.value += 1
	
