/// @description SendPacket(buffer);
/// @param buffer
buffer = argument0;
with(objClientServer){
	network_send_udp(socket,localHost,port,other.buffer,buffer_tell(other.buffer));
}