

x = oNewt.x;
y = oNewt.y-20;

image_angle = point_direction(x,y,mouse_x,mouse_y);



recoil = max(0,recoil - 1);

if oNewt.hasControl && (mouse_check_button_pressed(mb_left))
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

x = x - lengthdir_x(recoil, image_angle);
y = y - lengthdir_y(recoil, image_angle);

if (image_angle > 90) && (image_angle < 270)
{
	image_yscale = -1;
	
}