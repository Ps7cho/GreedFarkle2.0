/// @description AI Pass or Roll
if !Setup exit;
if !currentPlayer.AI exit
if tweening > 0 exit
if bustState exit

var number = checkNumbFrozen();
var myPoints = (currentPlayer.points + roundPoints + Points);

with (objPlayer){
	if finalRound{
		with (other){
			var pointsToBeat = GetWinnersPoints();
			if myPoints < pointsToBeat{  //if you are not winning in the final round 
				RollDice();
				AISelectPoints = wait;
				exit
			}else{
				Pass();	
				exit
			}
		}
	}
}


if myPoints >= winningTotal{ //If you are past winning total score pass.
	if currentPlayer.isWinning == true{							// and winning 
		Pass();
		exit
	}
}


if number == numbDice { // if you have all dice selected roll again.
	RollDice();
	AISelectPoints = wait;
	exit
}
if roundPoints > 1000 { // if this round you have gained more than 100 
	var doit = Chance(0.7); // pass 70% of the time
	if doit {
		Pass();	
		exit
	}
}

if currentPlayer.points < threshold{ // Get points on the board
	if (roundPoints + Points) >= threshold {
		Pass();
		exit
	}
}else{ //if you are on the board
	if number == numbDice -1 {
		Pass();	
		exit
	}else{
		RollDice();
		AISelectPoints = wait;
		exit
	}
}

RollDice();
AISelectPoints = wait;