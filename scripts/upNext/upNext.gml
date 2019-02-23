///upNext();
var now = ds_list_find_index(playerList,currentPlayer)
var next = Wrap(now+1, 0,numbPlayers-1);
var nextP = ds_list_find_value(playerList, next);

return nextP;