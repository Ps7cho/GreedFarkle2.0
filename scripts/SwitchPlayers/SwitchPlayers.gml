/// @description switch players
if !Setup exit;
lastPlayer = currentPlayer;
currentPlayer = upNext();
nextPlayer = upNext();

x1 = room_width/2;
x2 = (room_width/6);
x3 = (room_width/6)*5;

if currentPlayer.AI {
	AISelectPoints = AISelectTime;
}

CheckGameOver();

