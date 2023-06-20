extends Node

# all temp shit, gotta make this all work for four local players or something
var Players = []
var CharacterFileList = []

func _ready():
	SearchCharacters()
	AddPlayer()

func AddPlayer():
	var ToAdd = [
		CharacterFileList[0][2], 0
	]
	Players.append(ToAdd)

func SearchCharacters():
	var file = File.new()
	file.open("res://Game/Player/characters/script/characterlist.tres", file.READ)
	while !file.eof_reached():
		var csv = file.get_csv_line()
		CharacterFileList.append(csv)
	file.close()
	print(CharacterFileList)
