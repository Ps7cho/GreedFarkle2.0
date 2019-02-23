/// @description 
if myId = -1{ //UPD Manual connection 
		
	buffer_seek(buffer, buffer_seek_start, 0);
	buffer_write(buffer, buffer_u8, networkEvents.initialConnect);
	network_send_udp(socket, localHost, port, buffer, buffer_tell(buffer));
	
}