/// @description 
type = network_socket_udp;
port = 6112;

localHost = "192.168.1.65";
ipAddress = string(76)+string(.187)+string(.20)+string(.162);

socket = network_create_socket(type);
//isConnected = network_connect(socket, localHost, port);

size = 256;
var type = buffer_fixed;
var alignment = 1;
buffer = buffer_create(size,type,alignment);
bufferLarge = buffer_create(1024,type,alignment);

globalvar clientMap;
clientMap = ds_map_create();
myId = -1;
playerName = noone;

globalvar debug;
debug = true;

enum networkEvents {
	ping,
	name,
	connect,
	initialConnect,
	save,
	
	disconnect,
}
