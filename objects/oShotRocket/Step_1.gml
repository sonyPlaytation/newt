/// @description Insert description here
// You can write your code in this editor

//screen pause
if screenPause() {exit;};

guidedShot();
if crit {color = c_red; draw_set_color(color);}

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
}

image_xscale = 2;
image_yscale = 2;



