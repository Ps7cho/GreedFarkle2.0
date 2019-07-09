/// @description Insert description here
// You can write your code in this editor
	draw_text(100,120,Ping);
	draw_text(100,50,isConnected);
	draw_text(500,50,localHost);
	
var margin = 80;

if startLobby or joinLobby or inlobby{


	draw_set_alpha(0.5)
	var color = c_black;
	var colorW = c_white;
	draw_rectangle_color(room_width/2,margin-5,room_width-margin,room_height-margin+15,color,color,color,color,false);
	draw_rectangle_color(room_width/2,margin-5,room_width-margin,room_height-margin+15,colorW,colorW,colorW,colorW,true);
	draw_rectangle_color(room_width/2,margin-5,room_width-margin,(margin*2)-20,colorW,colorW,colorW,colorW,true);
	draw_set_alpha(1);
}

#region joinlobby
if joinLobby{
	draw_set_font(fnt_HighwindMed);
	draw_text(room_width/2+margin*2.1,(margin),"Host Name");
	draw_text(room_width/2+margin+300,(margin),"Score");
	draw_text(room_width/2+margin+500,(margin),"Threshold");
	draw_text(room_width/2+margin+700,(margin),"Players");
	
	for (var j=0; j<255; j++){
		var i = ds_grid_get(lobbyList,j,0)	
		if i < 1 break;
	}
	j = min(j,11);
	for (var i=0; i<j; i++){
		
		var name =	ds_grid_get(lobbyList,i,1);//hosts name
		var total = ds_grid_get(lobbyList,i,2);//score total to win
		var hold =	ds_grid_get(lobbyList,i,3);//scoring threshold
		var numb =	ds_grid_get(lobbyList,i,4); //number of clients connected
		var client =ds_grid_get(lobbyList,i,5);// hosts client id on the server
		
		if (mouse_x > (room_width/2+margin)) and mouse_x < (room_width-margin)
		and	 mouse_y > ((margin*2)+i*margin) and  mouse_y <((margin*2)+(i+1)*margin){
			draw_set_color(c_gray);
			if mouse_check_button_pressed(mb_left){
				instance_deactivate_layer("JoinOnline");
				instance_activate_layer("OnlineLobby");
				joinLobby = false;
				inlobby = true;
				sendPacket(networkEvents.joinRoom,32,client,2,ObjGame.playerNames[| 0]);
			}
		}else{
			draw_set_color(c_white);	
		}
		
		draw_text(room_width/2+margin*2.1,(margin*2)+i*margin,string(name));
		
		var more =  300;
		draw_text(room_width/2+margin+more,(margin*2)+i*margin,string(total));
		more += 175;
		draw_text(room_width/2+margin+more,(margin*2)+i*margin,string(hold));
		more += 225;
		draw_text(room_width/2+margin+more,(margin*2)+i*margin,string(numb));
	}
}
#endregion

if inlobby{
	for (i=0; i<instance_number(objPlayer); i++){
		draw_text(room_width/2+margin*2.1,(margin*2)+i*margin,string(ds_list_find_value(playerList,i)));
	}
}