
ds_map_clear(Wins);
ds_list_clear(scores);
with(objPlayer){
	instance_destroy(self);	
}

Win = noone;