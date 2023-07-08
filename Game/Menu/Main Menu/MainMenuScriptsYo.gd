extends Spatial

func _ready():
	get_tree().paused = false
	InitiateSaveShit()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$Control/Menu/Button2.grab_focus()
	SoundtrackSystem.SetSongs("res://Game/Media/Soundtrack/PC/The Theme.ogg", 
	"res://Game/Media/Soundtrack/64/Roaming South Park (64).mp3", 
	"res://Game/Media/Soundtrack/PS/Roaming South Park.ogg",
	"res://Game/Media/Soundtrack/Remake/1. Roaming South Park.ogg")
	SoundtrackSystem.PlaySong()

func InitiateSaveShit():
# Set/Toggle stuff in the settings menus
# Game Settings
# Input Settings
# Audio Settings
	$Control/AudioSettings/masvol/OptionButton.value = SaveGame.Settings["mastervolume"]
	$Control/AudioSettings/osttype/OptionButton.selected = SaveGame.Settings["soundtrack"]
# Video Settings
	# Resolution code not active yet
	$Control/VideoSettings/frame/framecheck.value = SaveGame.Settings["maxfps"]
	$Control/VideoSettings/vsync/CheckButton.pressed = SaveGame.Settings["vsync"]
	# too lazy to make Fullscreen code
	$Control/VideoSettings/fxaa/fxaacheck.pressed = SaveGame.Settings["fxaa"]
	# might add an MSAA mode
	# update: maybe not

func switchmenus(a, b):
	get_node(a).set_visible(true)
	get_node(b).set_visible(false)

func _on_Button2_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Game/Levels/devlevel/devlevel.tscn")

func _on_multtomain_pressed() -> void:
	$Control/Multiplayer.visible = false
	$Control/Menu.visible = true

func _on_Multiplayer_pressed() -> void:
	$Control/Multiplayer.visible = true
	$Control/Menu.visible = false

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
	pass

func _on_Exit_pressed():
	SaveGame.saveconf()
	get_tree().quit()

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

# Audio Settings

func _on_OptionButton_item_selected(index: int) -> void:
	SoundtrackSystem.ChangeOST(index)
	SaveGame.Settings["soundtrack"] = index

func _on_OptionButton_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, linear2db(value))
	SaveGame.Settings["mastervolume"] = value

# Video Settings

func _on_CheckButton_toggled(button_pressed: bool):
	OS.vsync_enabled = button_pressed
	SaveGame.Settings["vsync"] = button_pressed

func _on_fxaacheck_toggled(button_pressed: bool):
	get_viewport().fxaa = button_pressed
	SaveGame.Settings["fxaa"] = button_pressed

func _on_framecheck_value_changed(value: float):
# warning-ignore:narrowing_conversion
	Engine.target_fps = value
	SaveGame.Settings["maxfps"] = value

func _on_custom_pressed() -> void:
	get_tree().change_scene("res://Game/Menu/Mod/modmenu.tscn")
