/// @description 
/// @description 
network_destroy(socket);
buffer_delete(buffer);
buffer_delete(bufferLarge);
ds_map_destroy(clientMap);
ds_grid_destroy(lobbyList);

//Disconnect()