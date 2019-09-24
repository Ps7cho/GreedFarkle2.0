if startMenu {

	if mouse_check_button_pressed(mb_left){
		var back = collision_point(mouse_x,mouse_y,objBack,false,true);
		if back {
			DeactivateAllLayers();
			//saveLocalGame();
			
			if back = OptionsBack{
				instance_activate_layer("Start");
			}else if back = OnlineBack{
				instance_activate_layer("Play");
			}else if back = LobbyBack{
				lobby = false;
				instance_activate_layer("Play");
			}else if back = PlayBack{
				instance_activate_layer("Start");
			}else if back = JoinOnlineBack{
				server.joinLobby = false;
				instance_activate_layer("Online");
			}else if back = HostOnlineBack{
				server.startLobby = false;
				instance_activate_layer("Online");
			}else if back = OnlineLobbyBack{
				server.inlobby = false;
				instance_activate_layer("JoinLobby");
				instance_deactivate_layer("OnlineLobby");
				server.joinLobby = true;
				//leave the servers lobby and reset all the things
			}else{
				instance_activate_layer("Options");
			}
		}
		#region   Start Menu
		var options = collision_point(mouse_x,mouse_y,objOptions,false,true);
		if options {
			OptionMenu = true;
			ClearRound();
			instance_activate_layer("Options");
			instance_deactivate_layer("Start");
		}
		var playButton = collision_point(mouse_x,mouse_y,objPlay1,false,true);
		if playButton {
			ClearRound();
			instance_activate_layer("Play");
			playSelect = true;
			instance_deactivate_layer("Start");
		}
		var TutorialButton = collision_point(mouse_x,mouse_y,objTutorial,false,true);
		if TutorialButton {
			Tutorial = true;
			ClearRound();
			instance_activate_layer("Tutorial");
			instance_deactivate_layer("Start");
			SetupTutorial();
		}
		#endregion
		#region Play
		var local = collision_point(mouse_x,mouse_y,objLocal,false,true);
		if local {
			instance_activate_layer("Lobby");
			lobby = true;
			instance_deactivate_layer("Play");
			if server != noone{
				instance_destroy(server);
				server = noone;
			}
		}
		var online = collision_point(mouse_x,mouse_y,objOnline,false,true);
		if online {
			ClearRound();
			instance_activate_layer("Online");
			instance_deactivate_layer("Play");
		}
		#endregion
		#region Online
		var Host = collision_point(mouse_x,mouse_y,objHost,false,true);
		if Host {
			instance_activate_layer("HostOnline");
			instance_deactivate_layer("Online");
			if server = noone{
				server = instance_create_layer(0,0,"Instances_1", objClientServer);
				server.Host = true;
				server.startLobby = true;
			}else{
				server.Host = true;
				server.startLobby = true;
			}
			with (server){
				sendPacket(networkEvents.host,32,winningTotal,16,threshold,2,ObjGame.playerNames[| 0],8,0);
			}
			instance_activate_layer("HostOnline");
			
		}
		var Join = collision_point(mouse_x,mouse_y,objJoin,false,true);
		if Join {
			instance_deactivate_layer("Online");
			if server = noone{
				server = instance_create_layer(0,0,"Instances_1", objClientServer);
			}
			with (server){
				ds_grid_set_region(lobbyList,0,0,30,255,0);
				sendPacket(networkEvents.roomQuery,8,1);
			}
			server.joinLobby = true;
			
			instance_activate_layer("JoinOnline");
		}
		
		#endregion
		#region Lobby
		var Play = collision_point(mouse_x,mouse_y,objPlay,false,true);
		if Play {
			instance_deactivate_layer("Lobby");
			//saveLocalGame();
			ClearRound();
			setupPlayers(numbPlayers);
			lobby = false;
		}
		var addplayers = collision_point(mouse_x,mouse_y,objAddPlayers,false,true);
		if addplayers {
			numbPlayers = Approach(numbPlayers,10,1);
		}
		var removeplayers = collision_point(mouse_x,mouse_y,objRemovePlayers,false,true);
		if removeplayers {
			if numbAI = numbPlayers -1{
				numbAI = Approach(numbAI,0,1);
			}
			numbPlayers = Approach(numbPlayers,2,1);
			
		}
		var AddAI = collision_point(mouse_x,mouse_y,objAddAI,false,true);
		if AddAI {
			numbPlayers = Approach(numbPlayers,10,1);
			numbAI = Approach(numbAI,numbPlayers-1,1);
		}
		var RemoveAI = collision_point(mouse_x,mouse_y,objRemoveAI,false,true);
		if RemoveAI {
			numbAI = Approach(numbAI,0,1);
		}
		var Edit = collision_point(mouse_x,mouse_y,objEditNames,false,true);
		if Edit {
				//turn off lobby
			instance_deactivate_layer("Lobby");
			lobby = false;
				//turn on Edit layer
			instance_activate_layer("EditRoom");
			EditRoom = true;
			keyboard_virtual_show(kbv_type_default,kbv_returnkey_default,kbv_autocapitalize_words,false);
				//find position of the button pressed in its list
			var button = Edit.id;
			pos = ds_list_find_index(edit, button);
			keyboard_string = string(ds_list_find_value(playerNames,pos));
		}
		if lobby{
			var size = (numbPlayers-numbAI);
			if size > Humans{
				var button = instance_create_layer(1100, 310+65*size, "Lobby", objEditNames);	
				ds_list_add(edit, button);	
			}else if size < Humans{
				instance_destroy(ds_list_find_value(edit,ds_list_size(edit)-1));
				ds_list_delete(edit,ds_list_size(edit)-1);
			}
			Humans = size;
		}
		#endregion
		#region Options Menu
		var controls = collision_point(mouse_x,mouse_y,objControls,false,true);
		if controls {
			OptionMenu = false;
			DeactivateAllLayers();
			instance_activate_layer("Controls");
		}
		var gameplay = collision_point(mouse_x,mouse_y,objGameplay,false,true);
		if gameplay {
			OptionMenu = false;
			DeactivateAllLayers();
			instance_activate_layer("Gameplay");
		}
		var Sounds = collision_point(mouse_x,mouse_y,objSounds,false,true);
		if Sounds {
			OptionMenu = false;
			DeactivateAllLayers();
			instance_activate_layer("Sounds");
		}
		
		#endregion
		#region  Gameplay Menu
		
		var adddie = collision_point(mouse_x,mouse_y,objAddDie,false,true);
		if adddie {
			numbDice = Approach(numbDice,5,1);
		}
		var removedie= collision_point(mouse_x,mouse_y,objRemoveDice,false,true);
		if removedie {
			numbDice = Approach(numbDice,5,1);
		}
		var ThresholdUp = collision_point(mouse_x,mouse_y,objThresholdUp,false,true);
		if ThresholdUp {
			threshold = Approach(threshold,1000,100);
		}
		var ThresholdDown= collision_point(mouse_x,mouse_y,objThresholdDown,false,true);
		if ThresholdDown {
			threshold = Approach(threshold,0,100);
		}
		var ScoreUp = collision_point(mouse_x,mouse_y,objScoreUp,false,true);
		if ScoreUp {
			winningTotal = Approach(winningTotal,100000,1000);
		}
		var ScoreDown= collision_point(mouse_x,mouse_y,objScoreDown,false,true);
		if ScoreDown {
			winningTotal = Approach(winningTotal,1000,1000);
		}
		var WinningBlue = collision_point(mouse_x,mouse_y,objWinningColor,false,true);
		if WinningBlue {
			WinnerColor = c_aqua;
		}
		var WinningRed= collision_point(mouse_x,mouse_y,objWinningRed,false,true);
		if WinningRed {
			WinnerColor = c_maroon;
		}
		#endregion 
	}
}else{


}