/// @description 

StartMenu();
if !Setup exit;

var number = checkNumbFrozen();
		#region Tutorial 
			if Tutorial{
				TutorialStep();
				exit;
			}
			#endregion
		#region Points and Pass button activation
if currentPlayer{
	var allthepoints = currentPlayer.points;
	allthepoints += roundPoints;
	allthepoints += Points;

	if (allthepoints < threshold) or (number = 0){
		instance_deactivate_object(objPass);	
	}else{
		if (Points > 0){
			instance_activate_object(objPass);
		}else{
			instance_deactivate_object(objPass);
		}
	}
}
#endregion
		#region //Roll Dice
if keyboard_check_pressed(vk_space) || device_mouse_check_button_pressed(0,mb_right){
	if bustState{
		destroyGreed();
		Bust1();
		endTurn();
		toss = 10;
		bustState = false;
	}
	if !currentPlayer.AI {
		rollStart();
	}
}
 #endregion
		#region Click on dice
if mouse_check_button_pressed(mb_left) || device_mouse_check_button_pressed(0,mb_left){
		if !currentPlayer.AI {
			ClickOnDice(); 
		}
}
#endregion
		#region buttons
if mouse_check_button_pressed(mb_left) or device_mouse_check_button_pressed(0,mb_left){
	if scoreboard{
		scoreboard = false;	
	}
	if !currentPlayer.AI {
		var pass = collision_point(mouse_x,mouse_y,objPass,false,true);
		if pass {
			Pass();
		}
		var fresh = collision_point(mouse_x,mouse_y,objFresh,false,true);
		if fresh{
			FreshHand();
		}
	}
	var ScoreBoard = collision_point(mouse_x, mouse_y, objScoreBoardButton,false,true);
	if ScoreBoard{
		scoreboard = !scoreboard;
	
	}
}

if mouse_check_button(mb_left) or device_mouse_check_button(0,mb_left){
	var exitbutton = collision_point(mouse_x, mouse_y, objExcapeButton,false,true);
	if exitbutton {
		exitHeld ++;
		
		if exitHeld > 60{
			EndGame(false);
			exit;
		}
	}
	
}else{
	exitHeld = 0;	
}

	#endregion


		#region AI Mind
if AISelectPoints == 0{
	AIGrabPoints();
		
}
if AiChooseTurn == 0{
	AIPassOrRoll();
		
}
	AiChooseTurn --;
	AISelectPoints --;
			
			#endregion
		#region Timers
if bustTimer1 == 0{
	Bust1();
}
if bustTimer2 == 0{
	reset();
	endTurn();
}
if SwitchPlayersTimer == 0{
	SwitchPlayers();
}
if RPscaleModify > 1{
	RPscaleModify -= 0.05;	
}else{
	RPscaleModify = 1;
}

if toss == 0 {
	reset();	
}

if midTurnToss == 0{
	RollDice();
}

midTurnToss --;
SwitchPlayersTimer --;
toss --;
bustTimer1 --;
bustTimer2 --;

#endregion