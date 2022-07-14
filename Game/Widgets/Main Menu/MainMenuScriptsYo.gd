extends Spatial

func _ready():
	get_tree().paused = false
	$Control/Music.play()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$Control/Menu/Button2.grab_focus()

func switchmenus(a, b):
	get_node(a).set_visible(true)
	get_node(b).set_visible(false)

func _on_Button2_pressed():
	get_tree().change_scene("res://Game/Levels/first.tscn")

func _on_settings_pressed():
	switchmenus("Control/Settings", "Control/Menu")

func _on_settomain_pressed():
	switchmenus("Control/Menu", "Control/Settings")
	
func _on_Button_pressed():
	switchmenus("Story", "Menu")

func _on_backtomain_pressed():
	switchmenus("Menu", "Story")

func _on_New_pressed():
	get_tree().change_scene("res://Game/Story Mode/Classic/CharacterSelect/StoryCharacterSelect.tscn")

func _on_Exit_pressed():
	get_tree().quit()

func _on_LineEdit_text_entered(new_text):
	GameJoltAPI.username = new_text

func _on_LineEdit2_text_entered(new_text):
	GameJoltAPI.user_token = new_text

func _on_gjlog_pressed():
	$Control/PopupPanel.show()


func _on_hidelogin_pressed():
	$Control/PopupPanel.hide()
	GameJoltAPI.add_achieved({
		"username" : GameJoltAPI.username,
		"user_token" : GameJoltAPI.user_token,
		"trophy_id" : 166506
	})
	GameJoltAPI.add_achieved({
		"username" : GameJoltAPI.username,
		"user_token" : GameJoltAPI.user_token,
		"trophy_id" : 166503
	})


func _on_onl_settings_pressed():
	switchmenus("Control/OnlineSettings", "Control/Settings")


func _on_onltoset_pressed():
	switchmenus("Control/Settings", "Control/OnlineSettings")
