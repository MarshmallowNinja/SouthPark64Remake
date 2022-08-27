# Character Stats
export var CharacterName : String = "Name"

export(int, 1000) var StartingHealth : int = 100
export(int, 1000) var MaxHealth : int = 100
export(bool) var Invincible : bool = false

export(int, 1000) var StartingArmor : int = 0
export(int, 1000) var MaxArmor : int = 100

# ammo
export(int) var MaxSnowballAmmo : int = 999999
export(int) var MaxDodgeballAmmo : int = 80
export(int) var MaxPlungerAmmo : int = 40
export(int) var MaxDartAmmo : int = 200
export(int) var MaxWarpoAmmo : int = 200
export(int) var MaxTPAmmo : int = 20
export(int) var MaxChickenAmmo : int = 20
export(int) var MaxGizmoAmmo : int = 100
export(int) var MaxCowAmmo : int = 40

# audio
export(Array, AudioStreamOGGVorbis) var SpawnSounds = []
export(Array, AudioStreamOGGVorbis) var PainSounds = []
export(Array, AudioStreamOGGVorbis) var DeathSounds = []
export(Array, AudioStreamOGGVorbis) var HealSounds = []
