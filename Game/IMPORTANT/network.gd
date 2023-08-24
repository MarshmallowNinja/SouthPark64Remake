extends Node

var Port : int 
var MaxPlayers : int
var MaxInBandwidth : int
var MaxOutBandwidth : int
var IPAddress
var IPToConnect

# Public little var so you could drag peers game to game
# or something.
var Peers = []

var Server
var Client

func _ready() -> void:
	FetchIP()

func FetchIP():
	match OS.get_name():
		"Windows":
			IPAddress = IP.get_local_addresses()[1]

func CreateServer():
	Server = NetworkedMultiplayerENet.new()
	Server.create_server(Port, MaxPlayers)
	get_tree().network_peer = Server

func JoinServer():
	Client = NetworkedMultiplayerENet.new()
	Client.create_client(IPAddress, Port)
	get_tree().network_peer = Client
