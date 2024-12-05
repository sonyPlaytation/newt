/// @description

image_angle -= (image_xscale * 5);

if homing and instance_exists(oNewt) and instance_exists(oBossMaynerd)
{
	range = point_distance(oNewt.x, oNewt.y, oBossMaynerd.x, oBossMaynerd.y);
	hsp = range/70*image_xscale;
}

vsp = vsp + grv;
//horizontal collision
if (place_meeting(x+hsp,bbox_top,oCollide))
{
	while (!place_meeting(x+sign(hsp),y,oCollide))
	{
		x = x + sign(hsp)
	}
	hsp = -hsp/2;
}
x += hsp

//vertical collision
if (place_meeting(x,y+vsp,oCollide)) or (place_meeting(x,y+vsp,oCollSemi))
{
	while (!place_meeting(x,y+sign(vsp),oCollide)) and (place_meeting(x,y+vsp,oCollSemi))
	{
		y += sign(vsp)
	}
	instance_destroy();
}
y += vsp;

if place_meeting(x,y,pAlly)
{
	var targ = instance_place(x,y,pAlly)
	playerHit(damage, targ);
}