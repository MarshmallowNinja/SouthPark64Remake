extends Control

func _ready():
	pass
#	match SaveGame.Settings["mods"]:
#		true:
#			$modwarning.visible = false
#		false:
#			$modwarning.visible = true

func _on_opendialog_pressed():
	$LoadPCK.popup_centered()

func _on_openother_pressed() -> void:
	$Loadres.popup_centered()

func _on_btm_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Game/Menu/Main Menu/MainMenu.tscn")

func _on_LoadPCK_file_selected(path: String):
	var file = ProjectSettings.load_resource_pack(path)
	if file == true:
		print("Mod Successfully Loaded.")
	else:
		OS.alert("Mod was not able to load successfully.", "Unsuccessful mod load.")

func _on_Loadres_file_selected(path: String):
	var level = get_tree().change_scene(path)
	if level != OK:
		OS.alert("Unsuccessful Mod Load. Error: " + level, "that sucks")
	else:
		var scene = load(path)
		
