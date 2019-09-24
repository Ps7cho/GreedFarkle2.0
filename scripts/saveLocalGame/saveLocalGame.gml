///Save the game settings to a list/ini
/*
ini_open("Save1.ini")
ini_write_real("settings", 11, numbDice);
ini_write_real("settings", 12, numbPlayers);
ini_write_real("settings", 13, numbAI);
//ini_write_real("settings", 14, Points);
//ini_write_real("settings", 15, roundPoints);
ini_write_real("settings", 16, threshold);
ini_write_real("settings", 17, winningTotal);
ini_write_real("settings", 18, currentPlayer);
if WinnerColor = c_aqua {
	ini_write_string("settings", "19", 1);
}else{
	ini_write_string("settings", "19", 2);
}

for (var i = 0; i<10; i++;){
	var name = ds_list_find_value(playerNames,i);
	if name = undefined {
		name = "Player";	
	}
	ini_write_string("players", i, name);	
}

ds_list_clear(save);
ini_close();
