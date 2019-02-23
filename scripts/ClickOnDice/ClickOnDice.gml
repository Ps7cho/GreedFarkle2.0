///ClickOnDice();


var die = collision_point(mouse_x,mouse_y,ObjDice,false,true);
if die {
	if !die.frozen && !Passed {
			
		if checkForPoints(die) {
			die.frozen = true;
			die.time = 0;
		}
	}else{
		if !die.locked{
			with ObjDice{
				if !locked {
					if value != 4 {
						if value != 0{
							frozen = false;	
						}
					}
				}
			}
			die.frozen = false;
		}
	}
	run = ds_list_create();
	with ObjDice{
		if !Counted and frozen{
			ds_list_add(other.run,self.value);
		}
	}
	addPoints(run);
	ds_list_destroy(run);
			
	device_mouse_dbclick_enable(false);
	alarm[0] = 18; //double tap timer
}
