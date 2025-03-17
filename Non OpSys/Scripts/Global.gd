extends Node
##Global stuff
##
## Pretty much holds variables, and also signals that don't really have any use

## Checks if "The Button" is pressed, which I am unsure of what "The Button" is
signal the_button_pressed
## Likely checks if the start menu is clicked off
signal clicked_off_start_menu
#var window: Window
#var viewport: Window
#var window_control: Control
#var windows: Array [Window]
## This packed scene is likely just leftover from the login screen where it would pop up when the user put in a wrong password
@onready var PopUpScene: PackedScene = preload("res://Non OpSys/Scenes/WrongPasswordBuddy.tscn")
## This packed scene just holds the Notebook application, internally called Notepad
@onready var FunnyNotepad: PackedScene = preload("res://Non OpSys/Scenes/Notepad.tscn")
## This packed scene just holds the File Management Application
@onready var FileManagement: PackedScene = preload("res://Non OpSys/Scenes/File Management.tscn")
## This packed scene just holds the Undeluxe Browser application (Internally called Internet)
@onready var Internet: PackedScene = preload("res://Non OpSys/Scenes/CEF.tscn")
## This packed scene just holds the PScribble application
@onready var Scribble: PackedScene = preload("res://Non OpSys/Scenes/p_scribble.tscn")
## This packed scene just holds the Photos Application
@onready var Photos: PackedScene = preload("res://Non OpSys/Scenes/Photos.tscn")
## This packed scene just holds the VibR Application
@onready var Vibr: PackedScene = preload("res://Non OpSys/Scenes/VibR.tscn")
## Likely meant to check if the user left the start menu on the UI
signal the_menu_has_been_left
## Likely meant to check if the user clicked off the start menu on the UI
signal the_menu_has_been_exited
## Just, a warning popup thing
var warning: Popup
## Likely meant to check if the user is using that window
var inWindow:bool = false
## Checks if you are in the UI
var inUI = false
## The wallpaper of the OS
var wallpaper
## This packed scene just holds the Video Player Application
@onready var MoviePlayer: PackedScene = preload("res://Non OpSys/Scenes/VideoPlayer.tscn")

@onready var Calendar: PackedScene = preload("res://Non OpSys/Scenes/Calendar/Calendar.tscn")
## This packed scene just holds the settings scene, currently unused
@onready var Settings: PackedScene = preload("res://Non OpSys/Scenes/Settings.tscn")
