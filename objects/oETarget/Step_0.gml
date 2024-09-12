

//screen pause
if screenPause() {exit;};

//if instance_exists(myRoom)
//{
//	if myRoom.roomActive {inactive = false} else inactive = true;
//}


if moveX
{
	//horizontal collision
	if (place_meeting(x+hsp,y,oCollide)) or (place_meeting(x+hsp,y,oKillPlane))
	{
		while (!place_meeting(x+sign(hsp),y,oCollide)) and (!place_meeting(x+sign(hsp),y,oKillPlane))
		{
			x = x + sign(hsp)
		}
		hsp = -hsp;			
	}
	x = x + hsp;
}

if moveY
{
	//horizontal collision
	if (place_meeting(x,y+vsp,oCollide)) or (place_meeting(x,y+vsp,oKillPlane))
	{
		while (!place_meeting(x,y+sign(vsp),oCollide)) and (!place_meeting(x,y+sign(vsp),oKillPlane))
		{
			y = y + sign(vsp)
		}
		vsp = -vsp;			
	}
	y = y + vsp;
}