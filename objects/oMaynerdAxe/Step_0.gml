/// @description

image_angle -= (image_xscale * 7);

if friendly = -1
{
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
}
else
{
	image_xscale = xFlip;
	
	vsp = vsp + grv;
	if (grv < 0.2) {grv += 0.02};

	//horizontal collision
	if (place_meeting(x+hsp,y,oCollide))
	{
		while (!place_meeting(x+sign(hsp),y,oCollide))
		{
			x += sign(hsp)
		}
		hsp = -hsp/2;
	}
	hsp = min(15, hsp*0.99);	
	x += hsp;

	//vertical collision
	if (place_meeting(x,y+2,oCollide)) 
	{
		while (!place_meeting(x,y+sign(vsp),oCollide)){y += sign(vsp)};
		instance_destroy();
	}
	
	if (place_meeting(x,y-abs(vsp),oCollide)) 
	{
		while (!place_meeting(x,y+sign(vsp),oCollide)){y += sign(vsp)};
		vsp = 0;
	}

	if (place_meeting(x,y+vsp,pEntity)) 
	{
		if !place_meeting(x,y+vsp,oEShooter)
		{
			while (!place_meeting(x,y+sign(vsp),oCollide)){y += sign(vsp)};
		}
	}
	y += vsp;

	if place_meeting(x,y,pEnemy)
	{
		var targ = instance_place(x,y,pEnemy)
		with (targ)
		{
			enemyHit(other.damage);
		}
		damage /=2;
		hsp /= 2;
	}
}