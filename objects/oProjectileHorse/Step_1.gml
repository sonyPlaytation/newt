/// @description Insert description here
// You can write your code in this editor



//screen pause
if screenPause() {exit;};

if !friendly and (place_meeting(x,y,pAlly))
{
	var _hitGuy = instance_place(x,y,pAlly)
	with(instance_place(x,y,_hitGuy))
	{
		playerHit(other.damage,_hitGuy);
	}
	instance_destroy();
}
	
if (place_meeting(x,y,oCollide))	{instance_destroy()};

if (friendly or spd > 7) and (place_meeting(x,y,pEnemy))	
{
	damage = 500; 
	radius = 1.15; 
	instance_destroy();
}

if instance_exists(oNewt) and oNewt.onGround
{
	if audio_is_paused(horseSound)
	{
		audio_resume_sound(horseSound);
	}

	if spd > 0.5 
	{
			xspd = lengthdir_x(spd, dir);
			yspd = lengthdir_y(spd, dir);

			x += xspd;
			y += yspd;
	}

	size *= 1.001;
	spd *= 1.015;
	image_speed = spd*5;

}
else if !oNewt.onGround
{
	audio_pause_sound(horseSound);
}

image_angle = dir;
image_xscale = size;
if (dir > 90) and (dir < 270){facing = -1} else facing = 1;