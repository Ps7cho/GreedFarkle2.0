var bottom = (room_height/10)*8;

instance_create_layer(600,bottom,"Top",objFresh);
audio_play_sound(Woosh,10,false);

Passed = true;
pass = true;
PassState = true;
passedHand = true;

endTurn();