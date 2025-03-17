extends MarginContainer
## Peak Dates
##
## Yeah, this script in this scene just marks the current day


##The uh, date
@export var date: Dictionary
##The panel container used for the date
@onready var panel_container: PanelContainer = %PanelContainer
##The label that has the text for the date
@onready var label: Label = %Label
##Sets up the day
func _ready() -> void:
	label.text = str(date.day)
	
	_set_unselected()
##Unselects the day if it isn't the current day
func _set_unselected():
	var currentDate = Time.get_datetime_dict_from_system()
	var isCurrentDate = date.day == currentDate.day and date.month == currentDate.month and date.year == currentDate.year
	
	if not isCurrentDate: panel_container.add_theme_stylebox_override("panel", StyleBoxEmpty.new())

##Should print the date, although it doesn't
func _on_button_pressed() -> void:
	print(date)
