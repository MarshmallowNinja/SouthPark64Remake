extends Control

var leveltoload = "No Level Selected."

func _ready():
	SoundtrackSystem.stop()
	# this block of code down here does not want to work
	# for some reason
#	match SaveGame.Settings["mods"]:
#		true:
#			$modwarning.visible = false
#		false:
#			$modwarning.visible = true

func _on_opendialog_pressed():
	$LoadPCK.popup_centered()

func _on_openother_pressed() -> void:
	$LoadLevel.popup_centered()

func _on_btm_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Game/Menu/Main Menu/MainMenu.tscn")

func _on_LoadPCK_file_selected(path: String):
	var file = ProjectSettings.load_resource_pack(path)
	if file == true:
		print("Mod Successfully Loaded.")
		get_tree().reload_current_scene()
	else:
		OS.alert("Mod was not able to load successfully.", "Unsuccessful mod load.")

func _on_LoadLevel_file_selected(path: String) -> void:
	leveltoload = path
	$levelpath.text = path
	$sidemenu/openother2.disabled = false

func _on_openother2_pressed():
	var level = get_tree().change_scene(leveltoload)
	if level != OK:
		OS.alert("Unsuccessful Mod Load. Error: " + level, "that sucks.")
	else:
		var scene = load(leveltoload)
#		get_tree().change_scene(path)

func _on_levelpath_text_entered(new_text: String) -> void:
	leveltoload = new_text
	$sidemenu/openother2.disabled = false
