reset();
with(ObjDice){
	Counted = false;
	frozen = false;
	locked = false;
}
roundPoints = 0;
if block {
	block = false;	
}
Passed = false;
if instance_exists(objFresh){
	instance_destroy(objFresh);	
}