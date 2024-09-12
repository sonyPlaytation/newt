

mouseX = display_mouse_get_x();
mouseY = display_mouse_get_y();


dist =	point_distance(mouseX,mouseY,oGrenadeWand,oGrenadeWand); //distance from mouse

x = oNewt.x;
y = oNewt.y-20;

image_angle = point_direction(x,y,mouse_x,mouse_y);


firingdelay = firingdelay - 1;
recoil = max(0,recoil - 1);

if (oInv.grenAmmo >=1) && (mouse_check_button(mb_right)) && (firingdelay < 0)
{
	recoil = 7;
	firingdelay = 60;
	with  (instance_create_layer(x,y,"Shots",oShotGrenade))
	{
		audio_play_sound(snShotHLGren,999,false)
		speed = clamp(oGrenadeWand.dist,oGrenadeWand.dist/130,oGrenadeWand.dist/100);
		direction = other.image_angle;
		image_angle = 0;
		oInv.grenAmmo--;
		oInv.grenAmmoString = string(oInv.grenAmmo);
	}
	
}

x = x - lengthdir_x(recoil, image_angle);
y = y - lengthdir_y(recoil, image_angle);

