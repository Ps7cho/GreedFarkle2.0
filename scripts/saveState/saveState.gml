///Save data to a file 
var RootList = ds_list_create();

var saveMap = ds_map_create();
ds_list_add(RootList,saveMap);
ds_list_mark_as_map(RootList, ds_list_size(RootList)-1);

ds_map_add(saveMap, "Number of dice", numbDice);
ds_map_add(saveMap, "Number of Players", numbPlayers);
ds_map_add(saveMap, "Number of AI", numbAI);
//ds_map_add(saveMap, "Current player points", Points);
//ds_map_add(saveMap, "Current hand points", roundPoints);
ds_map_add(saveMap, "Score threshold", threshold);
ds_map_add(saveMap, "Points to win", winningTotal);
ds_map_add(saveMap, "Current player ID", currentPlayer);
ds_map_add(saveMap, "Winner color", WinnerColor);

for (var i=0; i < ds_list_size(playerNames); i++){
	var Map = ds_map_create();
	ds_list_add(RootList,Map);
	ds_list_mark_as_map(RootList,ds_list_size(RootList)-1);
	
	ds_map_add(Map, "Name", playerNames[| i]);
	//ds_map_add(saveMap, "points", currentPlayer.points);
	//ds_map_add(saveMap, "color", currentPlayer.color);
}




//wrap the root list in a map
var Wrapper = ds_map_create();
ds_map_add_list(Wrapper, "ROOT",RootList);

// Save this all to a string
var String = json_encode(Wrapper);
SaveStringToFile("savegame.sav", String);

// destroy the data
ds_map_destroy(Wrapper);

show_debug_message("Game Saved");