///reset();

with(ObjDice){
	Counted = false;
	frozen = false;
	locked = false;
	giveValue(id);
}

numbFrozen = 0;


var b = checkBust();
if b {
	bust();	
}