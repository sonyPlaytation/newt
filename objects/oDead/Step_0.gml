if (done == 0)
{
	if hsp == 0{done++}else{done = 0};
	if vsp != 0{image_index = 0};
			
	var imgRot = 1;
	rot -= imgRot*image_xscale;
			
	vsp = vsp + grv;

	//horizontal collision
	if (place_meeting(x+hsp,y,oCollide))
	{
		while (!place_meeting(x+sign(hsp),y,oCollide))
		{
			x += sign(hsp)
		}
		hsp = -hsp/4;
	}
	x += hsp;

	//vertical collision
	if (place_meeting(x,y+vsp,oCollide))
	{
		if (vsp > 0) 
		{
			hsp *= 0.85;
			image_index = 1;
			rot = 0;
		}
		while (!place_meeting(x,y+sign(vsp),oCollide))
		{
			y += sign(vsp)
		}
		if vsp > 1{oSFX.goremain = true};
		vsp = 0;
	}
	y += vsp;
}