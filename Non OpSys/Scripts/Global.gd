extends Node
signal the_button_pressed
signal clicked_off_start_menu
#var window: Window
#var viewport: Window
#var window_control: Control
#var windows: Array [Window]
@onready var PopUpScene: PackedScene = preload("res://Non OpSys/Scenes/WrongPasswordBuddy.tscn")
@onready var FunnyNotepad: PackedScene = preload("res://Non OpSys/Scenes/Notepad.tscn")
@onready var FileManagement: PackedScene = preload("res://Non OpSys/Scenes/File Management.tscn")
@onready var Internet: PackedScene = preload("res://Non OpSys/Scenes/UndexluxeBrowser.tscn")
signal the_menu_has_been_left
signal the_menu_has_been_exited
var warning: Popup
var inWindow:bool = false
