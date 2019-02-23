///upLast();
var now = ds_list_find_index(playerList,currentPlayer)
var last = Wrap(now-1, 0,numbPlayers-1);
var lastP = ds_list_find_value(playerList, last);

return lastP;