extends Node

# onready bs
onready var snowball = "res://Game/PickUps/weapon/snowball/Snowball.tscn"
onready var icon = $"../Camera/CanvasLayer/HUD/weapon/weaponicon"

enum wep {none, snowball, dodgeball, plunger, dart, tp, warpo, egg, alien, cow}
var Weapon = wep.none

func _ready():
	pass

func SwitchWeapon():
	match Weapon:
		0: # Punch
			pass
		1: # Snowball
			icon.texture = "res://Game/Texture/UI/Player/weapon/snow1.png"
		2: # Dodgeball
			icon.texture = "res://Game/Texture/UI/Player/weapon/dodge1.png"
		3: # Plunger Gun
			icon.texture = "res://Game/Texture/UI/Player/weapon/plunger1.png"
		4: # Dart Gun
			icon.texture = "res://Game/Texture/UI/Player/weapon/dart1.png"
		5: # T&P 
			icon.texture = "res://Game/Texture/UI/Player/weapon/tp3.png"
		6: # Warpo Ray
			icon.texture = "res://Game/Texture/UI/Player/weapon/warpo4.png"
		7: # Sniper Chicken
			icon.texture = "res://Game/Texture/UI/Player/weapon/sniper1.png"
		8: # Alien Dancing Gizmo
			icon.texture = "res://Game/Texture/UI/Player/weapon/gizmo1.png"
		9: # Cow Launcher
			icon.texture = "res://Game/Texture/UI/Player/weapon/cow1.png"

func Fire():
	print("firing...")

func StopFire():
	print("alright, i'm done.")
