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
# export(Array, AudioStream) var CommAudio = []
# basic
export(Array, AudioStream) var SpawnAudio = []
export(Array, AudioStream) var PainAudio = [] # 1-29 HP
export(Array, AudioStream) var DeathAudio = []
export(Array, AudioStream) var HealAudio = []
export(Array, AudioStream) var WeaponPickUpAudio = []
# Damage+
export(Array, AudioStream) var MedPainAudio = [] # 30-49 HP
export(Array, AudioStream) var HevPainAudio = [] # 50-99 HP
export(Array, AudioStream) var ShockDamageAudio = []
export(Array, AudioStream) var GasDamageAudio = []
# Story
export(Array, AudioStream) var NearTownAudio = []
export(Array, AudioStream) var EmptyTeamSpawnAudio = []
# Enemy
export(Array, AudioStream) var TurkeyKillAudio = []
export(Array, AudioStream) var CloneKillAudio = []
export(Array, AudioStream) var CowKillAudio = []
export(Array, AudioStream) var AlienKillAudio = []
export(Array, AudioStream) var RobotKillAudio = []
export(Array, AudioStream) var ToyKillAudio = []
export(Array, AudioStream) var ToughEnemyAudio = []
