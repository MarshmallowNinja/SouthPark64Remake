extends Node

onready var pickupsound = $"../Pickup"

func _ready() -> void:
	pass

func PlaySound(stream):
	pickupsound.stream = stream
	pickupsound.play()

func Pickup(type : int):
# 0=Base, 1=Health, 2=Armor, 3=Weapon, 4=Invuln, 5=Zipp, 6=Fire, 7=Damage, 8=Max
	match type:
		0:
			var sound = load("res://Game/PickUps/other/ammopickup01.wav")
			PlaySound(sound)
		1:
			var sound = load("res://Game/PickUps/health/extrahealth01e.wav")
			PlaySound(sound)
		2:
			pass
		3:
			pass
		4:
			pass
		5:
			pass
		6:
			pass
		7:
			pass
		8:
			pass
