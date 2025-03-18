extends Control

# Hours Pointer
@onready var pivot_hours = $TextureRect/pivot_hours

#Minutes Pointer
@onready var pivot_minutes = $TextureRect/pivot_minutes

#Seconds Pointer
@onready var pivot_seconds = $TextureRect/pivot_seconds


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process(true)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_update_analog_clock()
	_update_label()


func _update_analog_clock():
	var time = Time.get_time_string_from_system(false)
	var timeArray = time.split(":")
	var seconds = int(timeArray[2])
	var minutes = int(timeArray[1])
	var hours = int(timeArray[0])
	#print(time)
	
	pivot_seconds.rotation_degrees = seconds * 6
	pivot_minutes.rotation_degrees = minutes * 6 + (seconds/10)
	pivot_hours.rotation_degrees = hours * 30 + (minutes/2)


func _update_label():
	var time = Time.get_time_string_from_system(false)
	var timeArray = time.split(":")
	var hour = timeArray[0]
	var minute = timeArray[1]
	var second = timeArray[2]
	if (int(hour) - 12) < 0:
		$Label.text = time + " AM"
	else:
		if int(hour) == 12:
			$Label.text = str(int(hour)) + ":" + minute + ":" + second + " PM" 
		else:
			$Label.text = str(int(hour) - 12) + ":" + minute + ":" + second + " PM" 
