extends Node

enum wep {none, snowball, dodgeball, plunger, dart, TP, warpo, egg, alien, cow}
var Weapon = wep.none

onready var geo : ImmediateGeometry = $"../Camera/weapontest/ImmediateGeometry"
onready var raycast : RayCast = $"../Camera/weapontest"
onready var texture = preload("res://Game/Texture/emptex.png")


func _ready():
	pass

func TestFire():
	if raycast.is_colliding():
		geo.begin(Mesh.PRIMITIVE_TRIANGLES, texture)
		geo.add_vertex($"../Camera".global_transform.origin)
		geo.add_vertex(raycast.get_collision_point())
		geo.end()
		print("fired")
	else:
		pass
