/// @description bust take off points, start roll
if currentPlayer.points < threshold{
	currentPlayer.points = 0;
}
roundPoints = 0;


with (ObjDice){
	Counted = false;
	frozen = false;
	locked = false;
}

with ObjDice{
	image_speed = 500;
}