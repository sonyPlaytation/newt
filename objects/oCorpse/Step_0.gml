

//code for in the belly
if !inBelly
{
	fresh--;
	if fresh <=0
	{
		instance_destroy();	
	}	
	alpha = 1;
}
else
{
	alpha = 0;
	
	digest--;
	if digest <=0
	{
		oInv.full = 0;
		oInv.inBelly = noone;
		instance_destroy();	
		playerHeal(1,false);
	}	
}

//if died by fire
if charred
{
	var _x = random_range(bbox_left-10,bbox_right+10);
	var _y = random_range(bbox_bottom+10,bbox_top-10);
	instance_create_depth(_x,_y,depth-10,oFlameParticle);
}

switch (corpse)
{
	case "generic":
		if (done == 0)
		{
			vsp = vsp + grv;

			//horizontal collision
			if (place_meeting(x+hsp,y,oCollide))
			{
				while (!place_meeting(x+sign(hsp),y,oCollide))
				{
					x += sign(hsp)
				}
				hsp = 0;
			}
			x += hsp;

			//vertical collision
			if (place_meeting(x,y+vsp,oCollide))
			{
				if (vsp > 0) 
				{
					done = 1;
					image_index = 1;
				}
				while (!place_meeting(x,y+sign(vsp),oCollide))
				{
					y += sign(vsp)
				}
				vsp = 0;
			}
			y += vsp;
		}
	break;
	
	case "bat":
	
		var imgRot = 2;
		if vsp > 0 {oSFX.planefall = true};

		vsp = vsp + grv;

		rot += imgRot;

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
		if (place_meeting(x,y+vsp,oCollide)) 
		{
			while (!place_meeting(x,y+sign(vsp),oCollide)) 
			{
				y += sign(vsp)
			}
	
			repeat(multiplier)
			{
				instance_create_layer(x,bbox_bottom, "Player", oSpookyGhost);
			}
	
			with (instance_create_depth(x,y,depth,oExplosion)) {friendly = 0};
			instance_destroy();
		}

		if (place_meeting(x,y+vsp,pEntity)) 
		{
			if !place_meeting(x,y+vsp,oEShooter)
				while (!place_meeting(x,y+sign(vsp),oCollide)) 
				{
					y += sign(vsp)
				}
	
				repeat(multiplier)
				{
					instance_create_layer(x,bbox_bottom, "Player", oSpookyGhost);
				}
	
				with (instance_create_depth(x,y,depth,oExplosion)) {friendly = 0};
				instance_destroy();
	
		}

		y += vsp;
	
	break;
}