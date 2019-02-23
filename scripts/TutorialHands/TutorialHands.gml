///TutorialHands()


var xx = 200  //spacing
for (var i=0; i<numbDice; i++) {
	ID = instance_create_layer((xx+20)*i+500, room_height/2,"Table",ObjDice);
	
	var size = ds_list_size(Hand);
	var Face = ds_list_find_value(Hand,i);

	ID.value = Face;
	ID.image_index = Face;
	ID.image_speed = 0;
	ID.frozen = false;
	ID.locked = false;
	ID.Counted = false;
	
}