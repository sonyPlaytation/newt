

//screen pause
if screenPause() {exit;};

if instance_exists(myRoom)
{
	if !myRoom.bossRoom
	{
		if myRoom.roomActive {inactive = false} else inactive = true;
	}
}


vsp = vsp + grv;

//dont walk off ledges
if (grounded) && (stayonledges) && (!place_meeting(x+hsp, y+1, oCollide))
{
		hsp = -hsp;	
}

if inactive = false
{
	//horizontal collision
	if (place_meeting(x+hsp,y,oCollide))
	{
		while (!place_meeting(x+sign(hsp),y,oCollide))
		{
			x = x + sign(hsp)
		}
		hsp = -hsp;
		image_xscale = -image_xscale;
	}

	x = x + hsp;
}

//vertical collision
if (place_meeting(x,y+vsp,oCollide))
{
	while (!place_meeting(x,y+sign(vsp),oCollide))
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
	sprite_index = sEWalkerAir;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}
else
{
	grounded = true;
	image_speed = 1;
	if (hsp == 0) or (inactive == true)
	{
		sprite_index = sEWalker;
	}
	else
	{
		sprite_index = sEWalkerWalk;
	}
}
if (hsp != 0) image_xscale = sign(hsp) * size;
image_yscale = size;