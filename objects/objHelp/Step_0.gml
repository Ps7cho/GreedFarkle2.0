/// @description 
image_alpha -= 0.001

if image_alpha <= 0{
	instance_deactivate_object(self);	
}