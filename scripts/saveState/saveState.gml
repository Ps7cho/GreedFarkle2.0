///Save the game settings in a map and sends it.
var saveMap = ds_map_create();
ds_map_add(saveMap, 11, numbDice);
ds_map_add(saveMap, 12, numbPlayers);
ds_map_add(saveMap, 13, numbAI);
ds_map_add(saveMap, 14, Points);
ds_map_add(saveMap, 15, roundPoints);
ds_map_add(saveMap, 16, threshold);
ds_map_add(saveMap, 17, winningTotal);
ds_map_add(saveMap, 18, currentPlayer);


for (var i=0; i < numbPlayers; i++){
	saveMap[? i+11] = currentPlayer.name;
	saveMap[? i+11] = currentPlayer.points;
	saveMap[? i+11] = currentPlayer.color;
	currentPlayer = upNext();
}

saveBuffer = buffer_create(256,buffer_grow,1)
buffer_seek(saveBuffer, buffer_seek_start, 0);
buffer_write(saveBuffer, buffer_u8, networkEvents.save);

ds_map_secure_save_buffer(saveMap,saveBuffer);

sendPacket(saveBuffer);