extends Node

var network = NetworkedMultiplayerENet.new()
var port = 1911
var max_servers = 5


# Called when the node enters the scene tree for the first time.
func _ready():
	StartServer()
	

func StartServer():
	network.create_server(port, max_servers)
	get_tree().set_network_peer(network)
	print("Authentication Server Started")
	
	network.connect("peer_connected", self, "PeerConnected")
	network.connect("peer_disconnected", self, "PeerDisconnected")
	
func PeerConnected(player_id):
	print("Gateway " + str(player_id) + " connected")
	
func PeerDisconnected(player_id):
	print("Gateway " + str(player_id) + " disconnected")
