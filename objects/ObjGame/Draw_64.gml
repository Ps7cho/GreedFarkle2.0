/// @description 

draw_set_color(textColor);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(fnt_HighwindLarge);
if Win != noone{
	draw_text(xx, (room_height/2), string(Win) + " won with " + string(Points)  + " points!" );
}
				#region Lobby
if lobby {
	for (var i =0; i<numbPlayers-numbAI; i++;){
		draw_set_color(colors[| i]);
		draw_text(1100, 360+65*i,playerNames[|i]); //this will make them backwards 
		
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
				//recive text from typing
			var text = keyboard_string;
				//replace name value with text 
			ds_list_replace(playerNames,pos,text);// (from startmenu Editbutton)
				//return to lobby
			EditRoom = false;
			lobby = true;
			instance_deactivate_layer("EditRoom");
			instance_activate_layer("Lobby");
		}
	}
}
		#endregion
if !Setup exit;



draw_set_alpha(0.7);
draw_rectangle_color(50,45,1878,116,c_dkgray,c_black,c_dkgray,c_black,false);
draw_set_alpha(1);
			#region Tweening
if tweening > 0 {
	x3 = lerp(x3,room_width/2,0.06); //Next player --> center
	if numbPlayers == 2{
		x1 = lerp(x1,(room_width/6)*5,0.06); //Current player --> Right(next)
	}else if numbPlayers > 2{
		x1 = lerp(x1,room_width/6,0.06); //Current player --> Left(Prev)
	}
	if (numbPlayers = 3){
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


				#region  Current Player
				
draw_set_color(currentPlayer.color);
draw_text(xx, y1, "Current Player");
if currentPlayer.isWinning {
	draw_sprite(FlamesSmall0,frame,xx,y4);
	draw_text(x1, y2, currentPlayer.name);
	draw_set_color(WinnerColor);
}else{
	draw_text(x1, y2, currentPlayer.name);
	draw_set_color(textColor);
}
draw_text(xx, y3, currentPlayer.points);

draw_set_color(textColor);
draw_text(xx, y5, roundPoints);
draw_text(xx, y6, Points);
#endregion
				#region Tutorial 
			if Tutorial{
				draw_text(room_width/2,(room_height/4)*3, ds_list_find_value(Hand, 5));
				exit;
			}
			#endregion


				#region  Next Player

draw_set_color(textColor);
draw_text(xx3, y1, "Next");
draw_set_color(nextPlayer.color);
if nextPlayer.isWinning {
	draw_sprite(FlamesSmall0,frame,xx3,y4);
	draw_text(x3, y2, nextPlayer.name);
	draw_set_color(WinnerColor);
}else{
	draw_text(x3, y2, nextPlayer.name);
	draw_set_color(textColor);
}
draw_text(xx3, y3, nextPlayer.points);
#endregion

				#region Previous Player
if numbPlayers > 2{
	draw_set_color(textColor);
	draw_text(xx2, y1, "Previous");
	draw_set_color(lastPlayer.color);
	
	if lastPlayer.isWinning {
		draw_sprite(FlamesSmall0,frame,xx2,y4);
		draw_text(x2, y2,lastPlayer.name);
		draw_set_color(WinnerColor);
	}else{
		draw_text(x2, y2,lastPlayer.name);
		draw_set_color(textColor);
	}
	draw_text(xx2, y3, lastPlayer.points);
}
#endregion

frame++;
if frame >= 60 frame = 0;
