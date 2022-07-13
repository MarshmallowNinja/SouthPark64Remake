extends Button

var sound = AudioStreamPlayer2D.new()


func _ready():
	sound.stream = "res://Game/Widgets/Main Menu/menumove01.wav"

func _on_Button_mouse_entered():
	PlayHoverSound()

func _on_Button_pressed():
	pass #

func PlayHoverSound():
	sound.play()

func _on_Button_focus_entered():
	PlayHoverSound()
