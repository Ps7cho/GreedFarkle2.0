		#region  And Rolling
	var number = checkNumbFrozen();
	if number = numbDice{ // all dice are frozen
			reset(); // unlock them and keep rolling
			number = checkNumbFrozen();
			if Points > 0 {
				roundPoints += Points;
				RPscaleModify = maxScaleMod;
				Points = 0;
			}
	}
	#endregion
		#region Hold requirement / Rolling
	if numbFrozen < number {// if you have locked a die then you can reroll the rest
		numbFrozen = number;// the new bar to pass on this next hand
		if Points > 0{
			roundPoints += Points;
			RPscaleModify = maxScaleMod;
			Points = 0;
		}
		
		for (var i = 0; i < numbDice; i++) {
			ID = Hand[| i];
			if ID.frozen = false{ // if it's  not locked reroll
				giveValue(ID);
			}else{
				ID.Counted = true;// if it is locked don't count its points again
				ID.locked = true;
			}
		}
	}
	#endregion
	var b = checkBust();
	if b {
		bust();	
	}
	if instance_exists(objFresh){
		instance_destroy(objFresh);	
	}
	if block {
		block = false;	
	}
	if PassState{
		if !b{
			PassState = false;
		}
	}
	if Passed {
		Passed = false;	
	}
	
	UpdateDicePosition();