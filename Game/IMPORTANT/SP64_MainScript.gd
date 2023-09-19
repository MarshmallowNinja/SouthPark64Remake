extends Node

var GlobalVar = {
# 0 = Freeroam/None, 1 = Story Mode - Solo, 2 = Solo PvE, 3 = Multiplayer,
# 4 = Story Mode - MP
	"IntendedMode" : 0
}

func _ready():
	SettingsInit()
	print("Welcome to South Park 64 Remake!")

func _process(_delta):
	if Input.is_action_pressed("game_mainmenu"):
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Game/Menu/Main Menu/MainMenu.tscn")

func SettingsInit():
	SaveGame.loadconf()
