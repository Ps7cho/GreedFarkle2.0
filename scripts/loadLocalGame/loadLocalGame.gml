///Load the game settings from a map
ini_open("Save1.ini");
save = ini_read_string("Save1", "0", 0);

numbDice =		ini_read_real("settings",11, 5);
numbPlayers =	ini_read_real("settings",12, 1);
numbAI =		ini_read_real("settings",13, 2);
//Points =		ini_read_real("settings",14, 0);
//roundPoints =	ini_read_real("settings",15, 0);
threshold =		ini_read_real("settings",16, 400);
winningTotal  = ini_read_real("settings",17, 10000);
currentPlayer = ini_read_real("settings",18, 0);
var color =		ini_read_real("settings",19, 1);

if color = 1 {
	WinnerColor = c_aqua;
}else{
	WinnerColor = c_maroon;
}
/*if currentPlayer > 0 {
	for (var i=0; i < numbPlayers; i++){
		var player = instance_create_layer(0,0,"Table", objPlayer);
		player.name = ds_map_find_value(save,string(i+11));
		player.points = ds_map_find_value(save, string(i+11));
		player.color = ds_map_find_value(save, string(i+11));
	}
	playerList = ds_map_find_value(save, "9",);
}*/
for (var i = 0; i<10; i++;){
	var name = ini_read_string("players",i,"Player");
	ds_list_replace(playerNames,i,name);
}
ini_close();
