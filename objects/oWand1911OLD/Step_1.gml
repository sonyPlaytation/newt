firingdelay--;

x = oNewt.x;
y = oNewt.y-20;

image_angle = point_direction(x,y,mouse_x,mouse_y);





recoil = max(0,recoil - 1);

if oNewt.hasControl && (mouse_check_button_pressed(mb_left)) && (firingdelay <= 0) && (oInv.pistAmmo > 0)
{
	recoil = 13;
	screenShake(15,7);
	firingdelay = 10;
	oInv.pistAmmo--;
	
	with (instance_create_layer(x,y,"Shots",oShotStarter))
	{
		audio_play_sound(snShot1911,500,false)
		speed = 40;
		direction = other.image_angle + random_range(-3,3);
		image_angle = direction;
		image_xscale = 1.5;
		image_yscale = 1.5;
	}
	
	with (instance_create_layer(x,y,"Shots",oCasing))
		{

			hsp = lengthdir_x(3, oWand1911OLD.image_angle-180 + random_range(-10, 10));

			vsp =  random_range(-7, -5);

			if (sign(hsp)!=0) image_xscale = sign(hsp); 	
		}
}


x = x - lengthdir_x(recoil, image_angle);
y = y - lengthdir_y(recoil, image_angle);

if (image_angle > 90) && (image_angle < 270)
{
	image_yscale = -1;
	left = true;
	right = false;
}
else
{
 image_yscale = 1;	
 right = true;
 left = false;
}

if left == true
{
image_index = 2;
}
{
if (firingdelay > 0) {image_index = 3};
}

if right == true
{
image_index = 0;
}
{
if (firingdelay > 0) {image_index = 1};
}
