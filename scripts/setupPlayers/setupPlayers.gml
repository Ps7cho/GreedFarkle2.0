startMenu = false;
var totalPlayers = argument0;
var players = numbPlayers; 
Points = 0;
AISelectPoints = 60;

for (var i=0; i<totalPlayers; i++){
	player = instance_create_layer(0,(room_height/10)+i*90,"Table", objPlayer);
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
		player.name = "Computer" + string(i);
	}
	ds_list_add(playerList,player);
	ds_list_add(scores,player);	
}


////////////////////////////////////////////START GAME/////////////////////////////////////
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
UpdateDicePosition();
Win = noone;

instance_activate_layer("Top");

if instance_exists(objHelp){
	if PC{
		objHelp.image_index = 0;		// PC 
	}else {
		objHelp.image_index = 1;		//Android 	
	}
}

if instance_exists(objGreed){
	instance_deactivate_object(objGreed);	
}
if instance_exists(objPass){
	instance_deactivate_object(objPass);	
}

var b = checkBust();
if b {
	bust();	
}

numbFrozen = checkNumbFrozen();
Setup = true;
