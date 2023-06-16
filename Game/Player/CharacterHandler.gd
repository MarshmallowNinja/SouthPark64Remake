extends Node

export(Resource) var Character

var ForceCharacter : bool = false
var ForcedCharacter # Make sure that this is a Resource file and not fucking anything else
var random = RandomNumberGenerator.new()
onready var talker = $"../Camera/talker"

func _ready():
	pass

func InitiateCharacter():
	pass

func PlaySound(sound : AudioStream, priority : bool):
	if talker.playing and priority == true: # stop playing sound if priority is true
		talker.stop()
		talker.stream = sound
		talker.play()
	if talker.playing and priority == false:
		pass # do nothing
	else:
		talker.stream = sound
		talker.play()

func SoundProcess(soundarray):
	var listofsounds
	var sound
	if soundarray.empty() or soundarray.size() == 0 or soundarray == null:
		pass
	else:
		random.randomize()
		listofsounds = soundarray.size()
		listofsounds -= 1
		sound = random.randi_range(0, listofsounds)
		return(sound)

func PlaySoundFromArray(soundarray, priority : bool):
	var sound = SoundProcess(soundarray)
	if sound == null:
		pass
	else:
		PlaySound(soundarray[sound], priority)

func _on_MainPlayer_Spawn() -> void:
	PlaySoundFromArray(Character.SpawnAudio, true)
