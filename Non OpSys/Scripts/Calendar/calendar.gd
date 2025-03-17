extends Control
##Peak Calendar

##The label that shows the month and year
@onready var month_year_label: Label = %MonthYearLabel
##Essentially holds the columns known for the days
@onready var columns_box: HBoxContainer = %ColumnsBox
##The scene that has the date label for peak calendar stuff
const DATE_LABEL = preload("res://Non OpSys/Scenes/Calendar/DateLabel.tscn")
##The months of the year
const MONTH_NAMES = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
##To be honest, I dunno what this is, I know nothing about unix time
const DAY_IN_UNIX_TIME = 86400
## This is just used as 1 or -1 to help the calendar change the month back by one or forward by one when a button is pressed
var monthToGoTo
##The uh, current day I think, I dunno, this whole scene came from a tutorial
var selectedDate = Time.get_datetime_dict_from_system()
##Sets up the calendar
func _ready() -> void:
	_set_calendar()
##As I am sure you can guess by the function name, sets up the calendar, including on updates to the calendar
func _set_calendar():
	print(selectedDate.month)
	print(selectedDate.year)
	set_month_year_label()
	
	var firstOfMonthDate = _get_first_of_month(selectedDate)
	var firstOfMonthUnixTime = Time.get_unix_time_from_datetime_dict(firstOfMonthDate)
	
	var startWeekday = firstOfMonthDate.weekday -1
	if startWeekday == -1: startWeekday = 6
	
	var startDate = Time.get_datetime_dict_from_unix_time(firstOfMonthUnixTime - DAY_IN_UNIX_TIME * (startWeekday))
	var calculateDate = startDate
	
	for i in 5 * 7:
		_create_label(calculateDate, i % 7)
		calculateDate = _get_next_day(calculateDate)
	if selectedDate.month != calculateDate.month: return
	
	for i in 7:
		_create_label(calculateDate, i % 7)
		calculateDate = _get_next_day(calculateDate)
##Changes the month and year label to the current month
func set_month_year_label():
	month_year_label.text = MONTH_NAMES[selectedDate.month - 1] + " " + str(selectedDate.year)
##Gets the first day of a month
func _get_first_of_month(date: Dictionary):
	date.day = 1
	
	var selectedUnixTime = Time.get_unix_time_from_datetime_dict(date)
	
	return Time.get_datetime_dict_from_unix_time(selectedUnixTime)
## Creates a new label
func _create_label(date: Dictionary, index: int):
	var dateLabel = DATE_LABEL.instantiate()
	dateLabel.date = date
	
	columns_box.get_children()[index].add_child(dateLabel)
## Gets the next day
func _get_next_day(date: Dictionary):
	var nextDayUnixTime = Time.get_unix_time_from_datetime_dict(date) + DAY_IN_UNIX_TIME
	return Time.get_datetime_dict_from_unix_time(nextDayUnixTime)
##Goes to the prior month
func _on_prior_month_button_pressed() -> void:
	monthToGoTo = -1
	_refresh_calendar()

##Goes to the next month
func _on_next_month_button_pressed() -> void:
	monthToGoTo = 1
	_refresh_calendar()
## Refreshes the calendar
func _refresh_calendar():
	selectedDate.month = selectedDate.month + monthToGoTo
	if selectedDate.month > 12:
		selectedDate.month = 1
		selectedDate.year += 1
	elif selectedDate.month < 1:
		selectedDate.month = 12
		selectedDate.year -= 1

	
	for column in columns_box.get_children():
		for node in column.get_children():
			if node is Label: continue
			
			node.queue_free()
	_set_calendar()
