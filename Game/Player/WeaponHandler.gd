extends Node

enum wep {none, snowball, dodgeball, plunger, dart, tp, warpo, egg, alien, cow}
var Weapon = wep.none

onready var raycast : RayCast = $"../Camera/weapontest"

func _ready():
	pass
