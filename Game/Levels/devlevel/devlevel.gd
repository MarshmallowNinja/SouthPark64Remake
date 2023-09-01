extends Spatial

func _ready() -> void:
	SoundtrackSystem.SetSongs(
		"res://Game/Media/Soundtrack/PC/Warehouse In South Park.ogg",
		"res://Game/Media/Soundtrack/64/Warehouse in South Park (64).ogg",
		"res://Game/Media/Soundtrack/PS/Warehouse in South Park.ogg",
		"res://Game/Media/Soundtrack/Remake/15. Warehouse in South Park.ogg"
	)
	SoundtrackSystem.PlaySong()
