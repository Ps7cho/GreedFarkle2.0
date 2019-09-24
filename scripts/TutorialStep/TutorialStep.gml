
if mouse_check_button_pressed(mb_left) or device_mouse_check_button_pressed(0,mb_left){
	ClickOnDice();

	var exitbutton = collision_point(mouse_x, mouse_y, objExcapeButton,false,true);
	if exitbutton {
		EndGame(false);
		Tutorial = false;
		currentPlayer.points = 0;
		exit;
	}
}

if keyboard_check_pressed(vk_space) || device_mouse_check_button_pressed(0,mb_right){
	// move to next hand
	if Hand == hand0 Hand = hand1;
	else if Hand == hand1{ Hand = hand2; roundPoints += Points;}
	else if Hand == hand2{ Hand = hand3; roundPoints += Points;}					 
	else if Hand == hand3{ Hand = hand4; roundPoints += Points;}					 
	else if Hand == hand4{ Hand = hand5; roundPoints += Points;}					 
	else if Hand == hand5{ Hand = hand6; roundPoints += Points;
							currentPlayer.points += roundPoints;
							roundPoints = 0;
							pass = true; Passed = true;}					 
	else if Hand == hand6{				 roundPoints = 0;
		Hand = hand7;
		instance_create_layer(Width,Height,"Top",objGreed);
		audio_play_sound(Hit_Hurt23,5,false);
	}
	else if Hand == hand7{
		Hand = hand1;
		if instance_exists(objGreed){
			instance_deactivate_object(objGreed);	
		}
	}
	with (ObjDice){
		instance_destroy();	
	}
	TutorialHands()
	Points = 0;
}


