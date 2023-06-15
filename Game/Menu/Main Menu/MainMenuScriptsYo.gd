extends Spatial

enum OSTtype {PC, N64, PSX, RM}

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
	$Control/Settings/game_settings.grab_focus()

func _on_settomain_pressed():
	switchmenus("Control/Menu", "Control/Settings")
	$Control/Menu/Button2.grab_focus()


func _on_Button_pressed():
	switchmenus("Story", "Menu")

func _on_backtomain_pressed():
	switchmenus("Menu", "Story")

func _on_New_pressed():
	get_tree().change_scene("res://Game/Story Mode/Classic/CharacterSelect/StoryCharacterSelect.tscn")

func _on_Exit_pressed():
	SaveGame.savegame()
	get_tree().quit()

func _on_gjlog_pressed():
	$Control/PopupPanel.show()

func _on_hidelogin_pressed():
#	$Control/PopupPanel.hide()
#	GameJoltAPI.add_achieved({
#		"username" : GameJoltAPI.username,
#		"user_token" : GameJoltAPI.user_token,
#		"trophy_id" : 166506
#	})
#	GameJoltAPI.add_achieved({
#		"username" : GameJoltAPI.username,
#		"user_token" : GameJoltAPI.user_token,
#		"trophy_id" : 166503
#	})
	pass

func _on_onl_settings_pressed():
	switchmenus("Control/OnlineSettings", "Control/Settings")
	$Control/OnlineSettings/netspeed.grab_focus()

func _on_onltoset_pressed():
	switchmenus("Control/Settings", "Control/OnlineSettings")
	$Control/Settings/onl_settings.grab_focus()


func _on_game_settings_pressed() -> void:
	$"Control/2021 icon crop".visible = false
	switchmenus("Control/GameSettings", "Control/Settings")
	$Control/GameSettings/gstog.grab_focus()

func _on_gstog_pressed() -> void:
	$"Control/2021 icon crop".visible = true
	switchmenus("Control/Settings", "Control/GameSettings")
	$Control/Settings/game_settings.grab_focus()


func _on_LineEdit_text_changed(_new_text: String) -> void:
	#GameJoltAPI.username = new_text
	pass
func _on_LineEdit2_text_changed(_new_text: String) -> void:
	#GameJoltAPI.user_token = new_text
	pass

func _on_aud_settings_pressed() -> void:
	$"Control/2021 icon crop".visible = false
	switchmenus("Control/AudioSettings", "Control/Settings")
	$Control/AudioSettings/astos.grab_focus()

func _on_astos_pressed() -> void:
	$"Control/2021 icon crop".visible = true
	switchmenus("Control/Settings", "Control/AudioSettings")
	$Control/Settings/aud_settings.grab_focus()


func _on_vid_settings_pressed() -> void:
	$"Control/2021 icon crop".visible = false
	switchmenus("Control/VideoSettings", "Control/Settings")
	$Control/VideoSettings/vidtoset.grab_click_focus()
	match OS.vsync_enabled: # see if VSync was already enabled
		true:
			$Control/VideoSettings/vsync/CheckButton.set_pressed(true)
		false:
			$Control/VideoSettings/vsync/CheckButton.set_pressed(false)
	$Control/VideoSettings/frame/framecheck.value = Engine.target_fps

func _on_vidtoset_pressed() -> void:
	$"Control/2021 icon crop".visible = true
	switchmenus("Control/Settings", "Control/VideoSettings")
	$Control/Settings/vid_settings.grab_focus()

# Video Settings

func _on_CheckButton_toggled(button_pressed: bool) -> void:
	OS.vsync_enabled = button_pressed
	SaveGame.Settings["vsync"] = button_pressed

func _on_fxaacheck_toggled(button_pressed: bool) -> void:
	get_viewport().fxaa = button_pressed
	SaveGame.Settings["fxaa"] = button_pressed

func _on_framecheck_value_changed(value: float) -> void:
	Engine.target_fps = value
	SaveGame.Settings["maxfps"] = value
