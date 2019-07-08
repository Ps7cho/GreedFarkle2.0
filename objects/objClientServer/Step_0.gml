/// @description 
pingInterval --;



if pingInterval <= 0{
	pingInterval = 10;
	sendPacket(networkEvents.ping,32,current_time);
}
	
	
if Host{
	//send current room settings to server
	if !startLobby {
		startLobby = true;
		sendPacket(networkEvents.host,32,winningTotal,16,threshold,2,ObjGame.playerNames[| 0],8,0);
	}
	//list peoples names and colors when they join
	
	//let people select colors
	
	// make a start game button
}

// Join
if joinLobby {
	for (var j=0; j<255; j++){
		var i = ds_grid_get(lobbyList,j,0)	
		if i < 1 break;
	}
	

//desplay them all in a list that is selectible 

// desplay your name and let it be editable 
}