/// @description Insert description here
// You can write your code in this editor
draw_text(100,120,Ping);
draw_text(100,50,isConnected);
draw_text(500,50,localHost);

var margin = 80;

if startLobby or joinLobby {
	draw_set_alpha(0.5)
	var color = c_black;
	draw_rectangle_color(room_width/2,margin,room_width-margin,room_height-margin,color,color,color,color,false);
	draw_set_alpha(1);
}
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
	for (var i=0; i<j; i++){
		var name = ds_grid_get(lobbyList,i,1);
		var total = ds_grid_get(lobbyList,i,2);
		var hold = ds_grid_get(lobbyList,i,3);
		var numb = ds_grid_get(lobbyList,i,4);
		draw_text(room_width/2+margin*2.1,(margin*2)+i*margin,string(name));
		
		var more =  300;
		draw_text(room_width/2+margin+more,(margin*2)+i*margin,string(total));
		more += 175;
		draw_text(room_width/2+margin+more,(margin*2)+i*margin,string(hold));
		more += 225;
		draw_text(room_width/2+margin+more,(margin*2)+i*margin,string(numb));
	}
}