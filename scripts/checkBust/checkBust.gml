///checkBust();



newHand = ds_list_create();
with ObjDice{
	if !frozen{
		ds_list_add(other.newHand,self.value);
	}
}
ds_list_sort(newHand,true);

straight = scrCheckStraight(newHand);
if straight {
	ds_list_destroy(newHand);
	ds_list_destroy(straight);
	return false;	
}
var three = ofaKind(newHand, 3);
if three >= 0 {
	ds_list_destroy(newHand);
	return false;	
}
var pos = ds_list_find_index(newHand, 0)
if pos >= 0 {
	ds_list_destroy(newHand);
	return false;	
}
var pos = ds_list_find_index(newHand, 4)
if pos >= 0 {
	ds_list_destroy(newHand);
	return false;	
}

audio_play_sound(Hit_Hurt23,5,false);
return true;