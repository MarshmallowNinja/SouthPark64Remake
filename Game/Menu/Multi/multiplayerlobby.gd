extends Control

func _ready() -> void:
	pass



func _on_Button_toggled(button_pressed: bool) -> void:
	match button_pressed:
		true:
			$hotbar/Button.text = Network.IPAddress
		false:
			$hotbar/Button.text = "Click to Show IP."
