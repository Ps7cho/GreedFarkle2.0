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

	for (i = 0; i < ds_list_size(scores); i++){
		var guy = ds_list_find_value(scores,i);
		ds_list_add(WonPoints,guy.points);
		ds_list_add(WonNames,guy.name);
		ds_list_add(WonColors,guy.color);
	
	}
	audio_play_sound(Electro_win_sound,1,false);

}else{
	ClearRound();	
}

Passed = false;
pass = false;
PassState = false;
instance_deactivate_object(objPass);

if instance_exists(objFresh){
	instance_destroy(objFresh);	
}

for (var i=0; i<instance_exists(ObjDice); i++){
	instance_destroy(ObjDice)
}
destroyGreed();

ds_list_clear(playerList);
ds_list_clear(Hand);

AiChooseTurn = -1;
AISelectPoints = -1;

Points = 0;
roundPoints = 0;
currentPlayer = -1;
Setup = false;
instance_activate_layer("Start");
instance_deactivate_layer("Top");