
extends MeshInstance

export(Color) var RoofColor =  Color(0, 0, 0, 1) 
export(Color) var ExteriorColor =  Color(0, 0, 0, 1) 
export(Texture) var WindowTexture
export(Texture) var DoorTexture

#func _ready():
	#RoofColor = $".".material_override.
