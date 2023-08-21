extends Node

var configexists : bool = false
var modexists : bool = false
var enteredcheat : bool = false

var Settings = {
# Game Settings
	"allowmods" : false,
# Audio Settings
	"soundtrack" : 0,
	"mastervolume" : 1.0,
	
# Video Settings
	"resolution" : null,
	"maxfps" : 60,
	"fxaa" : false,
	"vsync" : false,
}

var Progress = {
# Characters - 64
	"alien" : false,
	"barbrady" : false,
	"biggayal" : false,
	"chef" : false,
	"garrison" : false,
	"ike" : false,
	"jimbo" : false,
	"liane" : false,
	"mackey" : false,
	"mephisto" : false,
	"ned" : false,
	"phillip" : false,
	"pip" : false,
	"marvin" : false,
	"terrance" : false,
	"wendy" : false,
# Characters - PC
	"jesus" : false,
	"santa" : false,
	"satan" : false,
	"shelly" : false,
# Characters - RM
	"0" : false,
	"1" : false,
	"2" : false,
# other
	"timescompleted" : 0,
	"newgameplus" : false,
}

func _ready() -> void:
	SoundtrackSystem.Soundtrack = Settings["soundtrack"]

func saveconf():
	var savefile = File.new()
	savefile.open("./config.cfg", File.WRITE)
	savefile.store_line(to_json(Settings))
	savefile.close()

func loadconf():
	var file = File.new()
	var getthing 
	
	match file.file_exists("./config.cfg"):
		false:
			configexists = false
			file.open("./config.cfg", File.WRITE)
			file.store_line(to_json(Settings))
			file.close()
		true:
			file.open("./config.cfg", File.READ)
			getthing = parse_json(file.get_line())
			Settings = getthing
			file.close()
			configexists = true

func saveprog():
	pass

func loadprog():
	pass

func checkmods():
	var dir = Directory.new()
	match dir.dir_exists("./mods"):
		true:
			modexists = true
		false:
			modexists = false
