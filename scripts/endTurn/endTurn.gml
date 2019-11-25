///endTurn();

roundPoints += Points;
if !bustState && Points > 0 {
	RPscaleModify = maxScaleMod;
}
currentPlayer.points += roundPoints;
Points = 0;
WhoIsWinning();


instance_deactivate_object(objPass);
block = true;
with ObjDice{
	if frozen {
		locked = true;
		Counted = true;
	}
}
UpdateDicePosition();

tweening = 30;
SwitchPlayersTimer = 35; //switch players

destroyGreed();

sortScores();

//saveState();
