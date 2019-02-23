///addPoints();

var hand = argument0;

Points = 0;
var numb = ds_list_size(hand);
ds_list_sort(hand, true);

if numb > 4 {
	straight = scrCheckStraight(hand);
	if straight {
		if numbDice = 6{
			Points += 2800;	
			return
		}else{
			Points += 2000;	
			return
		}
	}
}

if numbDice = 6{
	var six = ofaKind(hand,6);
	if six {
		Points += 4800;
		return
	}
}

if numb > 2{
	var temp = 0;
	for (var i=5; i>2; i--){
		var number = ofaKind(hand, i);
		if number >= 0{
			if number = 0{
				temp = 1000;
			}else{
				temp = (number+1)*100;
			}
			if i = 3 {
				Points += temp 
				
			}else if i = 4{
				Points += temp*2
				
			}else if i = 5{
				Points += temp*4;	
				
			}
		}
	}
}

for (var i=0; i<numb; i++){
	var pos = ds_list_find_index(hand,0);
	if pos >= 0 {
		Points += 100;
		ds_list_replace(hand, pos, -1);
	}
	var pos = ds_list_find_index(hand,4);
	if pos >= 0 {
		Points += 50;
		ds_list_replace(hand, pos, -1);
	}
}