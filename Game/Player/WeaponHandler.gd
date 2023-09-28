extends Node

# onready bs
onready var snowball = "res://Game/PickUps/weapon/snowball/Snowball.tscn"

enum wep {none, snowball, dodgeball, plunger, dart, tp, warpo, egg, alien, cow}
var Weapon = wep.none


func _ready():
	pass

func Fire():
	pass
