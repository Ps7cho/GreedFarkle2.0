///@arg Winner
var Won = argument0;
AISelectPoints = 80;//prevent AI from running after game ends
with objPlayer {
	if isWinning{
		Points = points;
		roundPoints = 0;
		if Won {
			other.Win = string(name);
			audio_play_sound(Electro_win_sound,1,false);
		}
	}
} 

for (var i=0; i<instance_exists(objPlayer); i++){
	instance_destroy(objPlayer)
}
for (var i=0; i<instance_exists(ObjDice); i++){
	instance_destroy(ObjDice)
}

ds_list_clear(playerList);
ds_list_clear(Hand);

currentPlayer = -1;
Setup = false;
instance_activate_layer("Start");
instance_deactivate_layer("Table");
instance_deactivate_layer("Top");