tool
extends MeshInstance

export(Color) var RoofColor =  Color(0, 0, 0, 1) 
export(Color) var ExteriorColor =  Color(1, 1, 1, 1) 
export(Texture) var WindowTexture
export(Texture) var DoorTexture
export(Texture) var SideWindowTexture

func _ready():
	$".".get_surface_material(0).albedo_color = RoofColor
	$".".get_surface_material(1).albedo_color = ExteriorColor
	$".".get_surface_material(2).albedo_texture = WindowTexture
	$".".get_surface_material(3).albedo_texture = DoorTexture
	$".".get_surface_material(4).albedo_texture = SideWindowTexture

func _process(_delta):
	if Engine.editor_hint:
		
		$".".get_surface_material(0).albedo_color = RoofColor
		$".".get_surface_material(1).albedo_color = ExteriorColor
		$".".get_surface_material(2).albedo_texture = WindowTexture
		$".".get_surface_material(3).albedo_texture = DoorTexture
		$".".get_surface_material(4).albedo_texture = SideWindowTexture
