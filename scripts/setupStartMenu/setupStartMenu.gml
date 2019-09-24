///setupStartMenu

instance_create_layer(300, 500, "Start", objPlay1);
instance_create_layer(800, 500, "Start", objTutorial);
instance_create_layer(1300, 500, "Start", objOptions);
instance_create_layer(Width, 0, "Start", objGreedMenu);

instance_create_layer(300, 500, "Play", objLocal);
//instance_create_layer(1300, 500, "Play", objOnline);


instance_create_layer(300, 500, "Options", objGameplay);
instance_create_layer(800, 500, "Options", objSounds);
instance_create_layer(1300, 500, "Options", objControls);

instance_create_layer(1300, 100, "Lobby", objAddPlayers);
instance_create_layer(1300, 100, "Lobby", objRemovePlayers);
instance_create_layer(1300, 250, "Lobby", objAddAI);
instance_create_layer(1300, 250, "Lobby", objRemoveAI);
instance_create_layer(300, 500, "Lobby", objPlay);

instance_create_layer(300, 200, "EditRoom", objDone);
edit = ds_list_create();
for (var i = 1; i<=Humans; i++;){
	var button = instance_create_layer(1100, 310+65*i, "Lobby", objEditNames);	
	ds_list_add(edit, button);
}



instance_create_layer(1300, 400, "Gameplay", objAddDie);
instance_create_layer(1300, 400, "Gameplay", objRemoveDice);
instance_create_layer(1300, 550, "Gameplay", objThresholdUp);
instance_create_layer(1300, 550, "Gameplay", objThresholdDown);
instance_create_layer(1300, 700, "Gameplay", objScoreUp);
instance_create_layer(1300, 700, "Gameplay", objScoreDown);
instance_create_layer(1300, 850, "Gameplay", objWinningColor);
instance_create_layer(1300, 850, "Gameplay", objWinningRed);

OptionsBack = 			instance_create_layer(200, 0, "Options",		objBack);
						instance_create_layer(200, 0, "Controls",		objBack);
LobbyBack = 			instance_create_layer(200, 0, "Lobby",			objBack);
OnlineBack = 			instance_create_layer(200, 0, "Online",			objBack);
						instance_create_layer(200, 0, "Sounds",			objBack);
						instance_create_layer(200, 0, "Gameplay",		objBack);
PlayBack = 				instance_create_layer(200, 0, "Play",			objBack);
OnlineLobbyBack = 		instance_create_layer(200, 0, "OnlineLobby",	objBack);
JoinOnlineBack = 		instance_create_layer(200, 0, "JoinOnline",		objBack);
HostOnlineBack = 		instance_create_layer(200, 0, "HostOnline",		objBack);
DeactivateAllLayers();

instance_create_layer(1200,650,"Top",objPass);
instance_create_layer(1000,450,"Top",objHelp);

instance_create_layer(300, 500, "Online", objHost);
instance_create_layer(800, 500, "Online", objJoin);

instance_create_layer(145,70,"Table",objExcapeButton);

DeactivateAllLayers();