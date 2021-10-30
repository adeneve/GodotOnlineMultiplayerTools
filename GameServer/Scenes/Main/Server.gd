extends Node

var network = NetworkedMultiplayerENet.new()
var port = 1909
var max_players = 100


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	StartServer()
	

func StartServer():
	network.create_server(port, max_players)
	get_tree().set_network_peer(network)
	print("Server Started")
	
	network.connect("peer_connected", self, "PeerConnected")
	network.connect("peer_disconnected", self, "PeerDisconnected")
	
func PeerConnected(player_id):
	print("player " + str(player_id) + " connected")
	
func PeerDisconnected(player_id):
	print("player " + str(player_id) + " disconnected")



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
