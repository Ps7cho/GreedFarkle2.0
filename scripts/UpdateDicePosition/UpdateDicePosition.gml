/// update dice positions based on number of dice visible 

// loop through all the dice 

activeDiceList = ds_list_create();
with(ObjDice){
	y = room_height/2;
		if !locked {
			//if they are visible add them to a list
			ds_list_add(ObjGame.activeDiceList, id);
			
		}else{
			y = -500;	
		}
}

//start in the center if one and move back half a slot per aditional visible dice
var size = ds_list_size(activeDiceList)
var startingPoint = xx;
	startingPoint = startingPoint-((size-1)*150);
for (var i = 0; i < size; i++){
	var thisDice = ds_list_find_value(activeDiceList,i);
	thisDice.x = (startingPoint+(i*300));
}
ds_list_destroy(activeDiceList);