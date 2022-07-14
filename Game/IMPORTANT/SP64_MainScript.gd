extends Node


# variables and shit
var Name : String = "New Kid"
enum OST {PC, N64, PSX, PCREMAKE, N64REMAKE, PSXREMAKE}
var OSTType = OST.PC
var gjcred = {
	"game_id" : "391682",
	"private_key" : "0bc873e20d27ac6d8b650641560c990b"
}


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Welcome to South Park 64 Remake!")
	GameJoltAPI.set_game_credentials(gjcred)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("game_mainmenu"):
		get_tree().change_scene("res://Game/Widgets/Main Menu/MainMenu.tscn")
