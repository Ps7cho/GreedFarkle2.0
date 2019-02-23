///endTurn();

roundPoints += Points;
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


tweening = 30;
SwitchPlayersTimer = 35; //switch players

saveState();
