tool
extends MeshInstance

export(Color) var RoofColor =  Color(0, 0, 0, 1) 
#b77600
export(Color) var ExteriorColor =  Color(0, 0, 0, 1) 
export(Texture) var WindowTexture
export(Texture) var DoorTexture

func _ready():
	$".".get_surface_material(0).albedo_color = RoofColor
	$".".get_surface_material(1).albedo_color = ExteriorColor

func _process(_delta):
	if Engine.editor_hint:
		$".".get_surface_material(0).albedo_color = RoofColor
		$".".get_surface_material(1).albedo_color = ExteriorColor
