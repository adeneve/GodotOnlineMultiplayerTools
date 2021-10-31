extends Node

var network = NetworkedMultiplayerENet.new()
var ip = "127.0.0.1"
var port = 1911

# Called when the node enters the scene tree for the first time.
func _ready():
	ConnectToServer()
	
func ConnectToServer():
	network.create_client(ip, port)
	get_tree().set_network_peer(network)
	
	network.connect("connection_succeeded", self, "ConnectionSuccess")
	network.connect("connection_failed", self, "ConnectionFailed")
	
func ConnectionSuccess():
	print("Connected to Authentication Server Successfully")
	
func ConnectionFailed():
	print("Failed to Connect to Authentication Server")
