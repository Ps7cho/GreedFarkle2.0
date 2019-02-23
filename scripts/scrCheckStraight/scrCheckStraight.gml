///scr_checkStraight(hand);
var hand = argument0;
var newHand = ds_list_create();
var straight = ds_list_create();
var numb = ds_list_size(hand);

//check for straights 
for (var r = 0; r <= 6; r++){
	var pos = ds_list_find_index(hand,r);
	if pos >= 0 { //if the rank exists in the new hand
		var val = ds_list_find_value(hand, pos);
		ds_list_add(straight, val);//add its value to your straight
		if ds_list_size(straight) >= 5 {// if 5 in a row
			return straight;// returns the ds_list with all the values in the straight
		}
	}else{
		ds_list_clear(straight);// if not, clear and keep checking
	}
}
