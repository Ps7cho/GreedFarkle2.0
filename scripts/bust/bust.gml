///Bust();
ds_list_destroy(newHand);

if nextPlayer.AI{
bustTimer1 = 30;//bust, take off points, start roll
bustTimer2 = 40;//bust 2 reset
}else{
	bustState = true;	
}
instance_create_layer(Width,Height,"Top",objGreed);

instance_deactivate_object(objPass);