/// @description Insert description here
// You can write your code in this editor

//screen pause
if screenPause() {exit;};

if global.soda[1] == true
{
	oMultiWeapon.showLaser = true;
	var targetdir = point_direction(x,y,mouse_x,mouse_y)
	dir += sin(degtorad(targetdir-dir))*13;
		
	image_angle = dir
	xspd = lengthdir_x(spd, dir);
	yspd = lengthdir_y(spd, dir);

	x += xspd;
	y += yspd;
	
	color = c_fuchsia;
	draw_set_color(color);
}
else
{
	xspd = lengthdir_x(spd, dir);
	yspd = lengthdir_y(spd, dir);

	x += xspd;
	y += yspd;
	
	color = c_white;
	draw_set_color(color);
}
if crit {color = c_red; draw_set_color(color);};

if rocketLaunchGood //rocket booster fx
{
	with (instance_create_depth(x,y,depth+10,oSmoke)){draw_set_color(c_black); image_speed = 1.25};
}

oSFX.rocketloop = true;
spd = min(20, spd + 2);

if (place_meeting(x,y,pEntity)) or (place_meeting(x,y,oCollide)) or (place_meeting(x,y,oHeadHitbox))
{
	instance_destroy();
	oSFX.rocketloop = false;
	
	with instance_create_layer(x,y,"Shots",oExplosion)
	{
		diedFrom = other.diedFrom;
		friendly = 0;
		baseDMG = other.baseDMG;	
		crit = other.crit;
	}	
}


image_xscale = 2;
image_yscale = 2;



