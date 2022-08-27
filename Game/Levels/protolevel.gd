extends Spatial

var ween : int = 0
var primus : int = 0

func _ready():
	$AudioStreamPlayer.play()
	#RichPresence.update_activity()

func _on_Area_area_entered(area):
	pass

func _on_AudioStreamPlayer3D_finished():
	pass # Replace with function body.

func _on_10HPDMGTEST_area_entered(area):
	if area.is_in_group("living"):
		get_tree().call_group("living", "Damage", 10)
	else:
		pass

func Echeck():
	if ween >= 3:
		$Misc/Viewport/VideoPlayer.play()
	else:
		pass
	
	if primus >= 3: # reminder to make a Primus easter egg. Hi code reader! 
		pass
	else:
		pass


func _on_cheese_weentrigger() -> void:
	ween += 1
	Echeck()
