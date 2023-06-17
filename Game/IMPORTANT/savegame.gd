extends Node

var configexists : bool = false
var modexists : bool = false

var Settings = {
	"blood" : false,
	"skipcs" : false,
	"enteredcheat" : false,
	
	# AUDIO SETTINGS
	"mastervolume" : 100,
	"uncensor" : false,
	
	# VIDEO SETTINGS
	"resolution" : null,
	"maxfps" : 60,
	"fxaa" : false,
	"vsync" : false,
}

func _ready() -> void:
	pass

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

func checkmods():
	var dir = Directory.new()
	match dir.dir_exists("./mods"):
		true:
			modexists = true
		false:
			modexists = false
