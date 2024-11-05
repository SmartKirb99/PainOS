extends Node
signal the_button_pressed
signal clicked_off_start_menu
var popup: Popup
var viewport: Window
var popup_control: Control
@onready var PopUpScene: PackedScene = preload("res://Non OpSys/Scenes/WrongPasswordBuddy.tscn")
@onready var FunnyNotepad: PackedScene = preload("res://Non OpSys/Scenes/Notepad.tscn")
signal the_menu_has_been_left
signal the_menu_has_been_exited
