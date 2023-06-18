extends AudioStreamPlayer

var Soundtrack : int
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

func SetSongs(PC, N64, PSX, RMK):
	PCSong = PC
	N64Song = N64
	PSXSong = PSX
	RMKSong = RMK

func PlaySong():
	System.stream_paused = true
	match Soundtrack:
		0:
			var PC : AudioStream = load(PCSong)
			System.stream = PC
		1:
			var N64 : AudioStream = load(N64Song)
			System.stream = N64
		2:
			var PSX : AudioStream = load(PSXSong)
			System.stream = PSX
		3:
			var RMK : AudioStream = load(RMKSong)
			System.stream = RMK
	System.stream_paused = false
	System.play()

func ChangeOST(ST : int):
	Soundtrack = ST
	SaveGame.Settings["soundtrack"] = Soundtrack
	System.stream_paused = true
	match Soundtrack:
		0:
			var PC : AudioStream = load(PCSong)
			System.stream = PC
		1:
			var N64 : AudioStream = load(N64Song)
			System.stream = N64
		2:
			var PSX : AudioStream = load(PSXSong)
			System.stream = PSX
		3:
			var RMK : AudioStream = load(RMKSong)
			System.stream = RMK
	System.stream_paused = false
	System.play()
