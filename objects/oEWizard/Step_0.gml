

//screen pause
if screenPause() {exit;};

if instance_exists(myRoom)
{
	if myRoom.roomActive {inactive = false} else inactive = true;
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

if instance_exists(oNewt) and !inactive
{
	selfCenter = y-(sprite_height/2);
	if collision_line(x, selfCenter, oNewt.x, global.newtCenter, oCollide, 1, 1) {canShoot = false}else{canShoot = true};	
	state();
}



