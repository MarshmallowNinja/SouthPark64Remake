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
		pass # do nothing is sound is playing and priority is false
	else: # if any other value, somehow, just play it anyways.
		talker.stream = sound
		talker.play()

func SoundProcess(soundarray):
	var listofsounds
	var sound
	if soundarray.empty() or soundarray.size() == 0 or soundarray == null:
		pass # if empty or null, don't do anything
	else:
		random.randomize() # might need to change this, could eat performance
		listofsounds = soundarray.size()
		listofsounds -= 1 # .size() doesnt have 0 as the first number
		sound = random.randi_range(0, listofsounds)
		#print(var2str(sound))
		return(sound)

func PlaySoundFromArray(soundarray, priority : bool):
	var sound = SoundProcess(soundarray)
	if sound == null:
		pass
	else:
		PlaySound(soundarray[sound], priority)

# i don't know why this is here
#func RandomlyPlaySoundFromArray(soundarray, priority : bool):
#	var sound = SoundProcess(soundarray)
#	if sound == null:
#		pass
#	else:
#		PlaySound(soundarray[sound], priority)

func _on_MainPlayer_Spawn() -> void:
	match Sp64MainScript.GlobalVar["IntendedMode"]:
		0: # None/Freeroam
			pass
		1: # Solo Story
			pass
		2: # Solo PvE
			PlaySoundFromArray(Character.SpawnAudio, true)
		3: # Multiplayer
			pass
		4: # Multiplayer Story
			pass

func _on_MainPlayer_Hurt() -> void:
	# Add something that makes this play by a RNG roll
	PlaySoundFromArray(Character.PainAudio, false)

func _on_MainPlayer_Heal() -> void:
	PlaySoundFromArray(Character.HealAudio, false)

func _on_MainPlayer_Death() -> void:
	PlaySoundFromArray(Character.DeathAudio, true)
