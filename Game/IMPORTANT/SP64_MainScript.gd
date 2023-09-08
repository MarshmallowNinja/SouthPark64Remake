extends Node

func _ready():
	SettingsInit()
	print("Welcome to South Park 64 Remake!")

func _process(_delta):
	if Input.is_action_pressed("game_mainmenu"):
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Game/Menu/Main Menu/MainMenu.tscn")

func SettingsInit():
	SaveGame.loadconf()
