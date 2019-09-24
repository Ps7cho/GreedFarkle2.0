///PassAnimation(Text);

var text = argument0;
var border = 30;
var y1 = (room_height/3)*1;
var y2 = ((room_height/3)*2);

if pass {
	xxx1 = 0;
	xxx2 = 0;
	pass = false;
}

var sped = 100;
if xxx1 <= room_width {
	xxx2 += sped ;
	
	draw_set_color(c_gray);
	draw_set_alpha(0.6);
	draw_rectangle(xxx1,y1,xxx2,y2,false); //Main
	draw_rectangle(xxx1,y1,xxx2,y1+border,false); // Top border
	draw_rectangle(xxx1,y2-border,xxx2,y2,false); // Botom border
	draw_set_alpha(1);
	
	if xxx2 > room_width*2 {
		xxx1 += sped;	
	}else if xxx2 > room_width/3 {
		draw_set_color(c_black);
		draw_set_font(fnt_HighwindLarge1);
		draw_set_valign(fa_center);
		draw_text(room_width/2,(y1+y2)/2, string(text));
		draw_set_font(fnt_HighwindLarge);
		draw_set_valign(fa_center);
	}
}else {
	if Tutorial{
		Passed = false;	
	}
}