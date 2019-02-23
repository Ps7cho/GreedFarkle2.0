///checkForPoints(ID);
///@param ID

var ID = argument0;
newHand = ds_list_create();
with ObjDice{
	if !locked{
		ds_list_add(other.newHand,self.value);
	}
}

straight = scrCheckStraight(newHand);
if straight {
	if ID.value != 0 and ID.value != 4 { // when a player selects not 1 or 5
		with ObjDice {		// select the rest of them
			if !frozen{  
				frozen = true;
				time = 0;
			}
		}
	}
	ds_list_destroy(straight);
	return true;
}
var three = ofaKind(newHand, 3);
if three >= 0 {
	if three = ID.value {
		with ObjDice{
			if value = three {
				if !frozen{
					frozen = true;
					time = 0;
				}
			}
		}
		ds_list_destroy(newHand);
		return true;	
	}
}
var pos = ds_list_find_index(newHand, 0)
if pos >= 0 {
	if ds_list_find_value(newHand,pos) = ID.value{
		ds_list_destroy(newHand);
		return true;	
	}
}
var pos = ds_list_find_index(newHand, 4)
if pos >= 0 {
	if ds_list_find_value(newHand,pos) = ID.value{	
		ds_list_destroy(newHand);
		return true;
	}
}

ds_list_destroy(newHand);
return false;