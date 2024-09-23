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

if charred
{
	var _x = random_range(bbox_left-10,bbox_right+10);
	var _y = random_range(bbox_bottom+10,bbox_top-10);
	instance_create_depth(_x,_y,depth-10,oFlameParticle);
}