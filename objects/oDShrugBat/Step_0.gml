/// @description Insert description here
// You can write your code in this editor

if vsp > 0 {oSFX.planefall = true};

vsp = vsp + grv;

image_angle += imgRot;

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


