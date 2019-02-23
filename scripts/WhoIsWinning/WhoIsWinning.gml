
var Winning = noone;

with (objPlayer){
	if isWinning {
		Winning = id;	
	}
}
if Winning = noone{
	with objPlayer{
		if points > 0{
			isWinning = true;	
		}
	}
}
if Winning{
	if currentPlayer.points > Winning.points {
		currentPlayer.isWinning = true;
		Winning.isWinning = false;	
	}
}