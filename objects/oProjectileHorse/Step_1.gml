/// @description Insert description here
// You can write your code in this editor



//screen pause
if screenPause() {exit;};


if spd > 0.5
{
	xspd = lengthdir_x(spd, dir);
	yspd = lengthdir_y(spd, dir);

	x += xspd;
	y += yspd;

	if !friendly and (place_meeting(x,y,pAlly))
	{
		var _hitGuy = instance_place(x,y,pAlly)
		with(instance_place(x,y,_hitGuy))
		{
			playerHit(other.damage,_hitGuy);
		}
		instance_destroy();
	}
	
	if (place_meeting(x,y,oCollide)) instance_destroy();
	
}

image_angle = dir;
if (dir > 270) and (dir < 90)
{
	image_yscale = size;
}
else image_yscale = size;

image_xscale = size;
size *= 1.001;
spd *= 1.015;
image_speed = spd*5;