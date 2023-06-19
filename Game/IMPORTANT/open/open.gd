extends Control


func _ready() -> void:
	$AnimationPlayer.play("open")


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	get_tree().change_scene("res://Game/Menu/Main Menu/MainMenu.tscn")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		$AnimationPlayer.advance(10.0)
