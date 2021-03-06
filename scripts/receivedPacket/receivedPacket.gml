///recievedPacked(packet);
var packet = argument[0];
var msgid = buffer_read(packet, buffer_u8);

switch(msgid){
#region Ping
	case networkEvents.ping:
	
		var time = buffer_read(packet, buffer_u32);
		Ping = current_time - time;
	break;
		#endregion
#region Name
	case networkEvents.name:
			
		var client = buffer_read(packet, buffer_u16);
		var name = buffer_read(packet, buffer_string);
		
		if(ds_map_exists(clientMap, string(client))){
		var clientObject = clientMap[? string(client)];
			clientObject.name = name;
		}
	break;
	#endregion	
#region other player joined room
case networkEvents.roomQuery:


	var hostName = buffer_read(packet, buffer_string);
	var total = buffer_read(packet, buffer_u32);
	var threshold = buffer_read(packet, buffer_u16);
	var numb = buffer_read(packet, buffer_u8);
	var client = buffer_read(packet, buffer_u32);
	
	for (var j=0; j<255; j++){
		var i = ds_grid_get(lobbyList,j,0)	
		if i = 0 break;
	}
	ds_grid_add(lobbyList,j,0,1);
	ds_grid_add(lobbyList,j,1,hostName);
	ds_grid_add(lobbyList,j,2,total);
	ds_grid_add(lobbyList,j,3,threshold);
	ds_grid_add(lobbyList,j,4,numb);
	ds_grid_add(lobbyList,j,5,client);

	break;
	#endregion
#region other player joined room
	case networkEvents.joinRoom:
			
		NewName = buffer_read(packet, buffer_string);
		NewColor = buffer_read(packet, buffer_u8);
		
		with ObjGame{
			var player = instance_create_layer(0,0,"Table", objPlayer);
			player.points = 0;
			player.isWinning = false;
			player.finalRound = false;
			player.AI = false;						
			player.local = false;
			player.color = colors[| other.NewColor];
			player.name = other.NewName
			ds_list_add(playerList,player);
		}
		
		break;
		#endregion
#region Someone connected	
	case networkEvents.connect:
		
		var 
		client = buffer_read(packet, buffer_u16);
		

			
	break;
		#endregion
#region Client Disconnect
	case networkEvents.disconnect: 
			
	
	break;

	#endregion
#region message
	case networkEvents.message:
			
		var client = buffer_read(packet, buffer_u16);
		var message = buffer_read(packet, buffer_string);
		
		if client = 0 {
			var name = "server"	
		}else{
			if(ds_map_exists(clientMap, string(client))){
				var clientObject = clientMap[? string(client)];
				var name = clientObject.name;
			}
		}
		localHost = string(name + ": "+ message);
		
	break;
	#endregion	
}