extends Node

# variables and shit
var Name : String = "New Kid"
enum OST {PC, N64, PSX, PCREMAKE, N64REMAKE, PSXREMAKE}
var OSTType = OST.PC

func _ready():
	SettingsInit()
	print("Welcome to South Park 64 Remake!")

func _process(delta):
	if Input.is_action_pressed("game_mainmenu"):
		get_tree().change_scene("res://Game/Widgets/Main Menu/MainMenu.tscn")

func SettingsInit():
	SaveGame.loadconf()
