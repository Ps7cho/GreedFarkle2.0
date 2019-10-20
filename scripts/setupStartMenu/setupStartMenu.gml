///setupStartMenu
var bottom = (room_height/6)*4;
var heightSection = (room_height/10);
var WidthSection = (room_width/10);


instance_create_layer(WidthSection*2, bottom, "Start", objPlay1);
instance_create_layer(WidthSection*5, bottom, "Start", objTutorial);
instance_create_layer(WidthSection*8, bottom, "Start", objOptions);
instance_create_layer(Width, 0, "Start", objGreedMenu);

instance_create_layer(WidthSection*2, bottom, "Play", objLocal);
//instance_create_layer(1300, 500, "Play", objOnline);


instance_create_layer(WidthSection*2,	bottom, "Options", objGameplay);
instance_create_layer(WidthSection*5,	bottom, "Options", objSounds);
instance_create_layer(WidthSection*8,	bottom, "Options", objControls);

instance_create_layer(WidthSection*7, 100, "Lobby", objAddPlayers);
instance_create_layer(WidthSection*7, 100, "Lobby", objRemovePlayers);
instance_create_layer(WidthSection*7, 250, "Lobby", objAddAI);
instance_create_layer(WidthSection*7, 250, "Lobby", objRemoveAI);
instance_create_layer(WidthSection*2, bottom, "Lobby", objPlay);

instance_create_layer(WidthSection*2, bottom, "EditRoom", objDone);
edit = ds_list_create();
for (var i = 1; i<=numbPlayers; i++;){
	var button = instance_create_layer(1100, 310+65*i, "Lobby", objEditNames);	
	ds_list_add(edit, button);
}



instance_create_layer(WidthSection*7, 400, "Gameplay", objAddDie);
instance_create_layer(WidthSection*7, 400, "Gameplay", objRemoveDice);
instance_create_layer(WidthSection*7, 550, "Gameplay", objThresholdUp);
instance_create_layer(WidthSection*7, 550, "Gameplay", objThresholdDown);
instance_create_layer(WidthSection*7, 700, "Gameplay", objScoreUp);
instance_create_layer(WidthSection*7, 700, "Gameplay", objScoreDown);
instance_create_layer(WidthSection*7, 850, "Gameplay", objWinningColor);
instance_create_layer(WidthSection*7, 850, "Gameplay", objWinningRed);

OptionsBack = 			instance_create_layer(WidthSection*2, heightSection*2, "Options",		objBack);
						instance_create_layer(WidthSection*2, heightSection*2, "Controls",		objBack);
LobbyBack = 			instance_create_layer(WidthSection*2, heightSection*2, "Lobby",			objBack);
OnlineBack = 			instance_create_layer(WidthSection*2, heightSection*2, "Online",			objBack);
						instance_create_layer(WidthSection*2, heightSection*2, "Sounds",			objBack);
						instance_create_layer(WidthSection*2, heightSection*2, "Gameplay",		objBack);
PlayBack = 				instance_create_layer(WidthSection*2, heightSection*2, "Play",			objBack);
OnlineLobbyBack = 		instance_create_layer(WidthSection*2, heightSection*2, "OnlineLobby",	objBack);
JoinOnlineBack = 		instance_create_layer(WidthSection*2, heightSection*2, "JoinOnline",		objBack);
HostOnlineBack = 		instance_create_layer(WidthSection*2, heightSection*2, "HostOnline",		objBack);
DeactivateAllLayers();

instance_create_layer(1200,heightSection*8,"Top",objPass);
instance_create_layer(1000,450,"Top",objHelp);
instance_create_layer(1850,145,"Top",objScoreBoardButton);

instance_create_layer(WidthSection*2,	bottom, "Online", objHost);
instance_create_layer(800,				bottom, "Online", objJoin);

instance_create_layer(145,70,"Table",objExcapeButton);

DeactivateAllLayers();