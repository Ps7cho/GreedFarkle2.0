/// @description 
draw_set_color(textColor);
//draw_text(100,100,fps_real);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_HighwindLarge);
				#region Win scoreboard
if Win != noone{
	var size = ds_list_size(WonPoints);
	
	draw_set_alpha(0.5);
	draw_rectangle_color((room_width/8),46,(room_width/8)*7,((room_height/12)+size*70)-Margin ,c_black,c_black,c_black,c_black,false);
	draw_rectangle_color((room_width/8),46,(room_width/8)*7,((room_height/12)+size*70)-Margin ,c_white,c_white,c_white,c_white,true);
	draw_set_alpha(1);
	
	for (var i= 0; i<size; i++){
		var points = ds_list_find_value(WonPoints,i);
		var name = ds_list_find_value(WonNames,i);
		var color = ds_list_find_value(WonColors,i);
		draw_set_color(color);
		draw_text(xx, (room_height/12)+i*70, string(name) + " finished with " + string(points)  + " points!" );
	}
}
			#endregion
				#region Lobby
				if server != noone{
					draw_text(400,400,string(server));
					draw_text(400,450,string(server.joinLobby));
					draw_text(400,550,string(server.startLobby));
				}
if lobby {
	for (var i =0; i<numbPlayers; i++;){
		draw_set_color(colors[| i]);
		draw_text(1100, 410+65*i,playerNames[|i]); //this will make them backwards 
		
	}
}
		#endregion
				#region EditRoom
if EditRoom {
	if string_length(keyboard_string) > 15  {
		keyboard_string = string_copy(keyboard_string, 1, 15);
	}
	draw_text(room_width/2,room_height/6, keyboard_string);
	if mouse_check_button_pressed(mb_left) or device_mouse_check_button_pressed(0,mb_left){	
		var Done = collision_point(mouse_x,mouse_y,objDone,false,true);
		if Done {
			DoneTyping();
		}
	}
	if keyboard_check_pressed(vk_enter){
		DoneTyping();	
	}
}
		#endregion
if !Setup exit;




draw_set_alpha(1);
draw_rectangle_color(50,45,1878,116,c_dkgray,c_black,c_dkgray,c_black,false);
draw_set_alpha(1);

			#region Tweening
if tweening > 0 {
	x3 = lerp(x3,room_width/2,0.06); //Next player --> center
	if numbPlayers+numbAI == 2{
		x1 = lerp(x1,(room_width/6)*5,0.06); //Current player --> Right(next)
	}else if numbPlayers+numbAI > 2{
		x1 = lerp(x1,room_width/6,0.06); //Current player --> Left(Prev)
	}
	if (numbPlayers+numbAI = 3){
		x2 = lerp(x2,(room_width/6)*5,0.06);// Previous player --> Next Player
	}else{
		x2 = lerp(x2,(x2 - 600),0.06);// Previous player --> off the board
	}
	tweening -= 1;
}

#endregion
			#region Pass Animation
			if Passed{
				passAnimation("Pass");
			}
			#endregion


				#region Current Player
				
draw_set_color(currentPlayer.color);
draw_text(xx, y1, "Current Player");
if currentPlayer.isWinning {
	draw_sprite(FlamesSmall0,frame,xx,y4-Margin);
	draw_text(x1, y2, currentPlayer.name);
	draw_set_color(WinnerColor);
}else{
	draw_text(x1, y2, currentPlayer.name);
	draw_set_color(textColor);
}
draw_text(xx, y3, currentPlayer.points);


draw_set_color(Blue);
if PassState {
	draw_text_transformed(xx, y6, roundPoints,scale*RPscaleModify*2,scale*RPscaleModify*2,0);
}else{
	draw_text_transformed(xx, y5, roundPoints,scale*RPscaleModify,scale*RPscaleModify,0);

	draw_set_color(Green);
	draw_text(xx, y6, Points);
}
#endregion
				#region Tutorial 
			if Tutorial{
				draw_set_color(textColor);
				draw_text(room_width/2,(room_height/4)*3, ds_list_find_value(Hand, 5));
				draw_text(xx+250, y3, "Total Points");
				draw_set_color(Blue);
				draw_text(xx+250,y5,"Points this round")
				draw_set_color(Green);
				draw_text(xx+250, y6, "Points Selected");
				exit;
			}
			#endregion


				#region Next Player

draw_set_color(textColor);
draw_text(xx3, y1, "Up Next");
draw_set_color(nextPlayer.color);
if nextPlayer.isWinning {
	draw_sprite(FlamesSmall0,frame,xx3,y4-Margin);
	draw_text(x3, y2, nextPlayer.name);
	draw_set_color(WinnerColor);
}else{
	draw_text(x3, y2, nextPlayer.name);
	draw_set_color(textColor);
}
draw_text(xx3, y3, nextPlayer.points);
#endregion

				#region Previous Player
if numbPlayers+numbAI > 2{
	draw_set_color(textColor);
	draw_text(xx2, y1, "Previous");
	draw_set_color(lastPlayer.color);
	
	if lastPlayer.isWinning {
		draw_sprite(FlamesSmall0,frame,xx2,y4-Margin);
		draw_text(x2, y2,lastPlayer.name);
		draw_set_color(WinnerColor);
	}else{
		draw_text(x2, y2,lastPlayer.name);
		draw_set_color(textColor);
	}
	draw_text(xx2, y3, lastPlayer.points);
}
#endregion
				#region scoreboard
if scoreboard{
	draw_set_alpha(0.7);
	draw_rectangle_color(0,0,room_width,room_height,c_black,c_black,c_black,c_black,false);
	draw_set_alpha(1);		
	
	//loop through the players list and show them in their colors heighest to lowest.

	
	for (i = 0; i < ds_list_size(scores); i++){
		var guy = ds_list_find_value(scores,i);
			
		draw_set_color(guy.color);
		draw_text(room_width/3, (room_height/12)+i*70, string(guy.name) + " has " + string(guy.points)  + " points!" );
	}
	
	
		/*
	size = instance_number(objPlayer)
	for (var i= 0; i<size; i++){
		 var this = ds_list_find_value(scores,i);
		 var guy = ds_map_find_value(Wins,this);
		 draw_set_color(guy.color);
		draw_text(xx, (room_height/12)+i*70, string(guy.name) + " finished with " + string(this)  + " points!" );
	}
	*/
}

#endregion
				#region exitHeld
if exitHeld > 0 {
	var screenCover = (room_width/45)*exitHeld;
	draw_circle_color(50,50,screenCover,c_black,c_black,false);
	//draw_rectangle_color(0,0,room_width,screenCover,c_black,c_black,c_black,c_black,false);	
}
				#endregion
frame++;
if frame >= 60 frame = 0;

