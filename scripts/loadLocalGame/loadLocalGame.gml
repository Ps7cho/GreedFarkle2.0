///Load the game settings from a file
var fileName = "savegame.sav";
if file_exists(fileName){
	ds_list_clear(playerNames);
	var buffer = buffer_load(fileName);
	var String = buffer_read(buffer, buffer_string);
	buffer_delete(buffer);
	
	var Wrapper = json_decode(String);
	
	var List = Wrapper[? "ROOT"];
	
	for (var i = 0; i < ds_list_size(List); i++){
		var map = List[| i];
	
		if i = 0{
			numbDice =		map[? "Number of dice"];
			numbPlayers =	map[? "Number of Players"];
			numbAI =		map[? "Number of AI"];
//			Points =		map[? "Current player points"];
//			roundPoints =	map[? "Current hand points"];
			threshold =		map[? "Score threshold"];
			winningTotal  = map[? "Points to win"];
			currentPlayer = map[? "Current player ID"];
			WinnerColor =	map[? "Winner color"];
			
		}else{
			//var player = instance_create_layer(0,0,"Table", objPlayer);
			//map[? "Name"] = player.name;
			//map[? "points"] = player.points;
			//map[? "color"] = player.color;
					
			ds_list_add(playerNames, map[? "Name"]);
		}
	}
	ds_map_destroy(Wrapper);
	show_debug_message("Game Loaded");
}

