/// @description 
type = network_socket_tcp;
port = 6112;

localHost = "169.254.38.128";
Address = string(170)+string(.72)+string(.9)+string(.39);

socket = network_create_socket(type);
isConnected = network_connect(socket, localHost, port);

size = 256;
var type = buffer_fixed;
var alignment = 1;
buffer = buffer_create(size,type,alignment);
bufferLarge = buffer_create(1024,type,alignment);

globalvar clientMap;
clientMap = ds_map_create();
myId = -1;
Ping = -1;
playerName = noone;

globalvar debug;
debug = true;

GameID = 0022;

enum networkEvents {
	ping,
	name,
	connect,
	roomQuery,
	joinRoom,
	save,
	host,
	message,
	input,
	
	disconnect
}

Host = false;
startLobby = noone;
joinLobby = false;
inlobby = false;

lobbyList = ds_grid_create(255,30);

pingInterval = 0;