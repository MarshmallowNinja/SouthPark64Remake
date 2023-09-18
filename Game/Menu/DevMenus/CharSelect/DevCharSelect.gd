extends Control


func _ready() -> void:
	$Characters/PopupMenu.popup_centered()


func _on_PopupMenu_id_pressed(id: int):
	PlayerController.ChangeCharacter(0, id)


func _on_respawn_pressed() -> void:
	$Characters/PopupMenu.popup_centered()
