if (done == 0)
{
	vsp = vsp + grv;
	image_angle +=15;

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
			alarm[0] = 60;
		}
		while (!place_meeting(x,y+sign(vsp),oCollide))
		{
			y += sign(vsp)
		}
		vsp = 0;
	}
	y += vsp;
}