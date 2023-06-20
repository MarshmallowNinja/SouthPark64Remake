extends Node

export(Resource) var Character

var random = RandomNumberGenerator.new()
onready var talker = $"../Camera/talker"

func _ready():
	InitiateCharacter()

func InitiateCharacter():
	var file = load(PlayerController.Players[0][0])
	Character = file

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
		print(var2str(sound))
		return(sound)

func PlaySoundFromArray(soundarray, priority : bool):
	var sound = SoundProcess(soundarray)
	if sound == null:
		pass
	else:
		PlaySound(soundarray[sound], priority)

#func RandomlyPlaySoundFromArray(soundarray, priority : bool):
#	var sound = SoundProcess(soundarray)
#	if sound == null:
#		pass
#	else:
#		PlaySound(soundarray[sound], priority)

func _on_MainPlayer_Spawn() -> void:
	PlaySoundFromArray(Character.SpawnAudio, true)

func _on_MainPlayer_Hurt() -> void:
	PlaySoundFromArray(Character.PainAudio, false)

func _on_MainPlayer_Heal() -> void:
	PlaySoundFromArray(Character.HealAudio, false)

func _on_MainPlayer_Death() -> void:
	PlaySoundFromArray(Character.DeathAudio, true)
