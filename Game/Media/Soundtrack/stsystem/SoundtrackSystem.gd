extends AudioStreamPlayer

var Soundtrack : int = 0
#				0 = PC
#				1 = 64 
#				2 = PSX
#				3 = Remake
var PCSong 
var N64Song
var PSXSong
#var RMKSong
onready var System = $"."

func _ready():
	pass

func SetSongs(PC, N64, PSX):
	PCSong = PC
	N64Song = N64
	PSXSong = PSX
	#RMKSong = RMK

func PlaySong():
	var PC : AudioStream = load(PCSong)
	var N64 : AudioStream = load(N64Song)
	var PSX : AudioStream = load(PSXSong)
	#var RMK : AudioStream = load(RMKSong)
	System.stream_paused = true
	match Soundtrack:
		0:
			System.stream = PC
		1:
			System.stream = N64
		2:
			System.stream = PSX
		#3:
			#System.stream = RMKSong
	System.stream_paused = false
	System.play()
