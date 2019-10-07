///@arg Winner
var Won = argument0;
startMenu = true;
AISelectPoints = 80;//prevent AI from running after game ends
with objPlayer {
	if isWinning{
		Points = points;
		roundPoints = 0;
	}
} 

if Won {
	Win = true;
	with (objPlayer){
		ds_map_add(Wins,points,id);
		ds_list_add(scores,points);
	}
	audio_play_sound(Electro_win_sound,1,false);
	ds_list_sort(scores,false);
}else{
	ClearRound();	
}

Passed = false;
pass = false;
instance_deactivate_object(objPass);

if instance_exists(objFresh){
	instance_destroy(objFresh);	
}

for (var i=0; i<instance_exists(ObjDice); i++){
	instance_destroy(ObjDice)
}
if instance_exists(objGreed){
	instance_destroy(objGreed);	
}

ds_list_clear(playerList);
ds_list_clear(Hand);

Points = 0;
roundPoints = 0;
currentPlayer = -1;
Setup = false;
instance_activate_layer("Start");
instance_deactivate_layer("Top");