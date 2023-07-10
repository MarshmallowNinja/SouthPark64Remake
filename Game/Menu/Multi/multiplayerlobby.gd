extends Control

func _ready() -> void:
	pass

func _on_Button_toggled(button_pressed: bool) -> void:
	match button_pressed:
		true:
			$main/hotbar/Button.text = Network.IPAddress
		false:
			$main/hotbar/Button.text = "Click to Show IP."

func _on_btm_pressed() -> void:
	get_tree().change_scene("res://Game/Menu/Main Menu/MainMenu.tscn")


func _on_text_text_entered(new_text: String) -> void:
	$main/logs/text.text = ""
