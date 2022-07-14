extends Spatial


func _ready():
	$AudioStreamPlayer.play()
	RichPresence.update_activity()

func _on_Area_area_entered(area):
	pass

func _on_AudioStreamPlayer3D_finished():
	pass # Replace with function body.
 
