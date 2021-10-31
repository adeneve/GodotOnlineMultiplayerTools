extends Node

var network = NetworkedMultiplayerENet.new()
var gateway_api = MultiplayerAPI.new()
var port = 1910
var max_players = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	StartServer()
	

func StartServer():
	network.create_server(port, max_players)
	set_custom_multiplayer(gateway_api)
	custom_multiplayer.set_root_node(self)
	custom_multiplayer.set_network_peer(network)
	print("Gateway Server Started")
	
	network.connect("peer_connected", self, "PeerConnected")
	network.connect("peer_disconnected", self, "PeerDisconnected")
	
func PeerConnected(player_id):
	print("User " + str(player_id) + " connected")
	
func PeerDisconnected(player_id):
	print("User " + str(player_id) + " disconnected")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not custom_multiplayer.has_network_peer():
		return
	custom_multiplayer.poll()
