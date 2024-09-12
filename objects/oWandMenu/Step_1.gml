



image_angle = point_direction(x,y,mouse_x,mouse_y);



recoil = max(0,recoil - 1);

if (mouse_check_button_pressed(mb_left))
{
	
	recoil = 4;
	screenShake(4,10);
	
	with (instance_create_layer(x,y,"Shots",oShotStarter))
	{
		audio_play_sound(snShotHLPist,500,false)
		speed = 25;
		direction = other.image_angle + random_range(-3,3);
		image_angle = direction;
	}
	
}



