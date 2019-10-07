		var number = checkNumbFrozen();
		if number = numbDice{
			midTurnToss = 15;
			with ObjDice{
				image_speed = 500;
			}
		}
		if numbFrozen < number {
			midTurnToss = 5;
			with ObjDice{
				if !frozen && !locked {
					image_speed = 500;
				}
			}
		}