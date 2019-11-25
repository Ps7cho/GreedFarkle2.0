/// @description AI select points
if !Setup exit;
if !currentPlayer.AI exit
if tweening > 0 exit
if bustState exit

destroyGreed();

if Passed{
	var number = checkNumbFrozen();
	if number == numbDice -1 {
		if roundPoints < 400{
			FreshHand();
		}
	}
	rollStart();
	AISelectPoints = wait;	
	exit
}


with (ObjDice){
	if !frozen {
		if checkForPoints(id) {
			if !currentPlayer.AI exit
			frozen = true;
			time = 0;
		}
	}
}
run = ds_list_create();
with ObjDice{
	if !Counted and frozen{
		ds_list_add(other.run,self.value);
	}
}

PassState = false;
addPoints(run);
ds_list_destroy(run);

AiChooseTurn = wait;