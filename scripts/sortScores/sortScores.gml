ds_list_clear(scores);
with (objPlayer){
	var i = ds_list_size(scores);
	if i = 0{
		ds_list_add(scores,id);	
	}else{
		for (var j = 0; j <i; j++){
			var better = ds_list_find_value(scores,j);
			if better.points < points {
				ds_list_insert(scores,j,id);
				break;
			}
		}
		if ds_list_find_index(scores,id) = -1 {
			ds_list_add(scores,id);	
		}
	}
	
}

/*
ds_map_clear(Wins);
ds_list_clear(scores);
with (objPlayer){
	ds_map_add(Wins,points,id);
	ds_list_add(scores,points);
	//draw_set_color(color);
	//draw_text(room_width/3, y, string(name) + " has " + string(points)  + " points!" );
}
ds_list_sort(scores,false);