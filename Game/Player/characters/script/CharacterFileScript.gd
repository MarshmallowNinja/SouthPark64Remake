extends Resource
class_name CharacterFile

# BASE CHARACTER STATS
export(String) var CharacterName 
export(Texture) var CharacterIcon 

export(int, 1000) var StartingHealth = 100
export(int, 1000) var MaxHealth  = 100
export(int, 1000) var StartingArmor : int = 0
export(int, 1000) var MaxArmor : int = 100

# AMMO AND WEAPONRY
export(int) var MaxDodgeballAmmo = 80
export(int) var MaxPlungerAmmo  = 40
export(int) var MaxDartAmmo  = 200
export(int) var MaxWarpoAmmo = 200
export(int) var MaxTPAmmo = 20
export(int) var MaxChickenAmmo  = 20
export(int) var MaxGizmoAmmo = 100
export(int) var MaxCowAmmo  = 40

# AUDIO
# export(Array, AudioStream) var CommSounds = []

export(Array, AudioStream) var SpawnSounds = []
export(Array, AudioStream) var PainSounds = []
export(Array, AudioStream) var DeathSounds = []
export(Array, AudioStream) var HealSounds = []
