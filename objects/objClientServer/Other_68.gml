/// @description recieve packets


var buffer = ds_map_find_value(async_load, "buffer");
buffer_seek(buffer, buffer_seek_start, 0);
receivedPacket(buffer);
