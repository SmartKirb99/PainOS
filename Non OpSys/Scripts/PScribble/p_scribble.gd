extends Control
##Pretty much used just to set the filter of the file to PNG files


##Adds a filter to saving, to save PNG Files
func _ready():
	$SaveFileDialog.add_filter("*.png ; Portable Network Graphics File")
	$SaveFileDialog.current_dir = "user://U/Pictures"
