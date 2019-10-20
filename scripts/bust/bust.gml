///Bust();

ds_list_destroy(newHand);

if nextPlayer.AI or currentPlayer.AI{
bustTimer1 = AISelectTime+50;//bust, take off points, start roll
bustTimer2 = AISelectTime+65;//bust 2 reset
}
if !currentPlayer.AI {
	bustState = true;	
	bustTimer1 = -1
	bustTimer2 = -1
}


instance_create_layer(Width,Height,"Top",objGreed);

instance_deactivate_object(objPass);