///upNext();
var now = ds_list_find_index(playerList,currentPlayer)
var totalPlayer = ds_list_size(playerList);
var next = Wrap(now+1, 0,totalPlayer-1);
var nextP = ds_list_find_value(playerList, next);


return nextP;