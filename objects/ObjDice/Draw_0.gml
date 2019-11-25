/// @description 
//draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_yellow,c_yellow,c_yellow,c_yellow,true);

if frozen {
	xscale = ease_out_elastic(time,0.8,0.4,duration);
	yscale = ease_out_elastic(time,0.8,0.4,duration);
	if locked {
		
			exit;	
		
		draw_sprite_ext(DiceBacdrop,1,x,y,xscale*scale,yscale*scale,0,c_white,image_alpha);
	}else{
		draw_sprite_ext(DiceBacdrop,0,x,y,xscale*scale,yscale*scale,0,c_white,image_alpha);
	}
	if time < duration{
		switch sparkle{
			case 0:
				draw_sprite(Click_dice1,time,x,y);
				break;
			case 1:
				draw_sprite(Click_dice2,time,x,y);
				break;
			case 2:
				draw_sprite(Click_dice3,time,x,y);
				break;
			case 3:
				draw_sprite(Click_dice4,time,x,y);
				break;
			case 4:
				draw_sprite(Click_dice5,time,x,y);
				break;
		}
		time++;
	}
}

draw_sprite_ext(sprite_index,image_index,x,y,0.6,0.6,0,c_white,image_alpha);


