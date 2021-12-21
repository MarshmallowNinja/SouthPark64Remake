extends Node


# variables and shit
var Name : String = "New Kid"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Welcome to South Park 64 Remake!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("game_mainmenu"):
		get_tree().change_scene("res://Game/Widgets/Main Menu/MainMenu.tscn")
