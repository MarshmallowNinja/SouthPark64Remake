extends AudioStreamPlayer

var Soundtrack : int = 0 
#				0 = PC
#				1 = 64 
#				2 = PSX
#				3 = Remake
var PCSong
var N64Song
var PSXSong
var RMKSong
onready var System = $"."

func _ready():
	pass

func SetSongs(PC : AudioStream, N64 : AudioStream, PSX : AudioStream, RMK : AudioStream):
	PCSong = PC
	N64Song = N64
	PSXSong = PSX
	RMKSong = RMK

func PlaySong(Soundtrack : int):
	System.stream_paused = true
	match Soundtrack:
		0:
			System.stream = PCSong
			System.play()
		1:
			System.stream = N64Song
			System.play()
		2:
			System.stream = PSXSong
			System.play()
		3:
			System.stream = RMKSong
			System.play()
