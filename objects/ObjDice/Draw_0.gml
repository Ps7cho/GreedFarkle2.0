/// @description 
if frozen {
	xscale = ease_out_elastic(time,0.8,0.4,duration);
	yscale = ease_out_elastic(time,0.8,0.4,duration);
	draw_sprite_ext(BigDice1,0,x,y,xscale*scale,yscale*scale,0,c_white,image_alpha);
	if time < duration{
		time++;
	}
}

draw_sprite_ext(sprite_index,image_index,x,y,0.6,0.6,0,c_white,image_alpha);

