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
	var numb = ds_list_size(lobbyList);
	for (var i=0; i<numb; i++){
		var name = ds_list_find_value(lobbyList,i);
		draw_text(room_width/2+margin,(margin*2)+i*margin,string(name));
		draw_text(300,300,numb);
	}
}