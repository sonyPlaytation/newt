/// @description Insert description here
// You can write your code in this editor

diedFrom = noone;
corpse = "generic";
cSprite = sEWalkerDie;
big = false;
friendly = -1;

global.getSizeKilled = 1;
if instance_exists(oRoomDetect)
{
	myRoom = instance_nearest(self.x,self.y,oRoomDetect);
	
}else {myRoom = noone;}

if (hasHead)
{
	myHead = instance_create_depth(x,bbox_top,depth-10,oHeadHitbox)
	with myHead {owner = other.id};
}
else myHead = noone;

stateIdle = function()
{
	sprite = sMaynerd;
	if instance_exists(oRoomMiddle) {if oRoomMiddle.x < x {image_xscale = -1;} else image_xscale = 1};
}

stateChop = function()
{
	
}

stateDash = function()
{
	
}

stateWalk = function()
{
	vsp = vsp + grv;

	if inactive = false
	{
		//horizontal collision
		if (place_meeting(x+hsp,bbox_top,oCollide))
		{
			while (!place_meeting(x+sign(hsp),y,oCollide))
			{
				x = x + sign(hsp)
			}
			hsp = -hsp;
		}
		x += hsp
	}

	//vertical collision
	if (place_meeting(x,y+vsp,oCollide)) or (place_meeting(x,y+vsp,oCollSemi))
	{
		while (!place_meeting(x,y+sign(vsp),oCollide)) and (place_meeting(x,y+vsp,oCollSemi))
		{
			y += sign(vsp)
		}
		vsp = 0;
	}

	y += vsp;

	//Animation
	if (!place_meeting(x,y+1,oCollide))
	{
		grounded = false;
		sprite_index = sMaynerdAir;
		image_speed = 0;
		if (sign(vsp) > 0) image_index = 1; else image_index = 0;
	}
	else
	{
		grounded = true;
		image_speed = 1;
		if (hsp == 0) or (inactive == true)
		{
			sprite_index = sMaynerd;
		}
		else
		{
			sprite_index = sMaynerdWalk;
		}
	}
	if (hsp != 0) image_xscale = sign(hsp) * size;
	image_yscale = size;
}

state = stateWalk;