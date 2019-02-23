
var totalPlayers = argument0;
var players = numbPlayers-numbAI; 
Points = 0;
AISelectPoints = 0;

for (var i=0; i<totalPlayers; i++){
	player = instance_create_layer(0,0,"Table", objPlayer);
	player.points = 0;
	player.isWinning = false;
	player.finalRound = false;
	if players > 0 {
		player.AI = false;
		player.color = colors[| i];
		player.name = playerNames[| i];
		players --;
	}else{
		player.AI = true;
		player.color = c_ltgray;
		player.name = "Computer" + "AI"+ string(i);
	}
	ds_list_add(playerList,player);
}
instance_activate_layer("Table");
currentPlayer = ds_list_find_value(playerList,irandom_range(0,(ds_list_size(playerList)-1)));

if Tutorial exit;	//////Tutorial Exit/////

nextPlayer = upNext();
lastPlayer = upLast();
//Setup dice
var xx = 200  //spacing
for (var i=0; i<numbDice; i++) {
	ID = instance_create_layer((xx+20)*i+500, room_height/2,"Table",ObjDice);
	ds_list_add(Hand,ID);
	giveValue(ID);
	ID.frozen = false;
	ID.locked = false;
	ID.Counted = false;
	
}
Win = noone;

instance_activate_layer("Top");
if instance_exists(objHelp){
	objHelp.image_index = 1;	//Android 
}


var b = checkBust();
if b {
	bust();	
}

numbFrozen = checkNumbFrozen();
Setup = true;
