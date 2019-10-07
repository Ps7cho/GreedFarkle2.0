///Bust();
ds_list_destroy(newHand);

if nextPlayer.AI{
bustTimer1 = AISelectTime+50;//bust, take off points, start roll
bustTimer2 = AISelectTime+60;//bust 2 reset
}else{
	bustState = true;	
}
instance_create_layer(Width,Height,"Top",objGreed);

instance_deactivate_object(objPass);