extends Area


func _ready() -> void:
	pass



func _on_10HPDMGTEST_area_entered(area: Area) -> void:
	if area.is_in_group("living"):
		get_tree().call_group("living", "Damage", 10)
	else:
		pass

func interact():
	print("Walk into the little spike, dumbass.")
