extends Spatial

var coop : bool = false

func _ready():
	SoundtrackSystem.SetSongs("res://Game/Media/Soundtrack/PC/The Theme.ogg", 
	"res://Game/Media/Soundtrack/64/Roaming South Park (64).mp3", 
	"res://Game/Media/Soundtrack/PS/Roaming South Park.ogg",
	"res://Game/Media/Soundtrack/Remake/1. Roaming South Park.ogg")
	SoundtrackSystem.PlaySong()
