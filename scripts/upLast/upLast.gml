///upLast();
var now = ds_list_find_index(playerList,currentPlayer)
var totalPlayer = ds_list_size(playerList);
var last = Wrap(now-1, 0,totalPlayer-1);
var lastP = ds_list_find_value(playerList, last);

return lastP;