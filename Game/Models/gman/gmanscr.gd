extends MeshInstance

var triggered : bool = false

func _ready():
	pass


func _on_Area_area_entered(area):
	match triggered:
		true:
			pass
		false:
			if area.is_in_group("playersight"):
				$AudioStreamPlayer3D.play()
				triggered = true
				$Timer.start()


func _on_Timer_timeout():
#	GameJoltAPI.add_achieved({
#		"username" : GameJoltAPI.username,
#		"user_token" : GameJoltAPI.user_token,
#		"trophy_id" : 166504
#	})
	queue_free()


func _on_AudioStreamPlayer3D_finished():
	$AudioStreamPlayer3D2.play()
