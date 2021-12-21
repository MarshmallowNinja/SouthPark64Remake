extends Control


func _ready():
	$Music.play()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func switchmenus(a, b):
	get_node(a).set_visible(true)
	get_node(b).set_visible(false)
	

# Button Functions switchmenus(visible, hide)
func _on_Exit_pressed():
	get_tree().quit()


func _on_Button2_pressed():
	get_tree().change_scene("res://Game/Levels/first.tscn")


func _on_settings_pressed():
	switchmenus("Settings", "Menu")


func _on_settomain_pressed():
	switchmenus("Menu", "Settings")


func _on_Button_pressed():
	switchmenus("Story", "Menu")


func _on_backtomain_pressed():
	switchmenus("Menu", "Story")


func _on_New_pressed():
	get_tree().change_scene("res://Game/Story Mode/Classic/CharacterSelect/StoryCharacterSelect.tscn")
