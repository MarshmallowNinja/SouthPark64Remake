extends MeshInstance

export(bool) var Damage = true
# If not damage, then it'll heal
export(int) var Amount
export(String) var Text

func _ready():
	$Label3D.text = Text

func _on_Area_body_entered(body: Node):
	match Damage:
		true:
			if body.is_in_group("living"):
				get_tree().call_group("living", "Damage", Amount)
			else:
				pass
		false:
			if body.is_in_group("living"):
				get_tree().call_group("living", "Heal", Amount)
			else:
				pass
