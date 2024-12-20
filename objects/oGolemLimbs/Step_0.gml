/// @description Insert description here
// You can write your code in this editor

if (done == 0)
{
	vsp = vsp + grv;
	

	image_angle -= hsp*max(2.5,size);

	//horizontal collision
	if (place_meeting(x+hsp,y,oCollide))
	{
		while (!place_meeting(x+sign(hsp),y,oCollide))
		{
			x += sign(hsp)
		}
		hsp = -hsp/2;
		repeat(irandom_range(5,10)) 
		{
			with (instance_create_layer(x + other.hsp,y-(sprite_height/2), layer, oBlood))
			{
				depth -= 100;
				hsp = other.hsp;
			}
		}
		
		oSFX.goremain = true;
		
	}
	x += hsp;

	//vertical collision
	if (place_meeting(x,y+vsp,oCollide))
	{
		if (vsp > 0) 
		{
			done = 1;
			image_index += 4;
			
			if place_meeting(x,y-2,oCollide){image_angle = 180}else image_angle = 0;
		}
		while (!place_meeting(x,y+sign(vsp),oCollide))
		{
			y += sign(vsp)
		}
		
		vsp = 0;
		repeat(irandom_range(5,10)) 
		{
			with (instance_create_depth(x+hsp,y-3, depth, oBlood))
			{
				vsp = random_range(-2,-4);
			}
		}
		
		oSFX.goremain = true;
	}
	y += vsp;
}

