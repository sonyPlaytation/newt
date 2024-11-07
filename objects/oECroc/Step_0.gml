/// @description Insert description here
// You can write your code in this editor

//screen pause
if screenPause() {exit;};

if instance_exists(myRoom)
{
	if myRoom.roomActive {inactive = false} else inactive = true;
}

if instance_exists(pAlly) and !inactive
{
	selfCenter = y-20;
	
	if mouthopen == true{runsprite = sECrocRunB;}else runsprite = sECrocRunA;
	
	//vertical collision
	if (place_meeting(x,y+vsp,oCollide))
	{
		while (!place_meeting(x,y+sign(vsp),oCollide))
		{
			y += sign(vsp);
		}
		vsp = 0;
		grounded = true;
	}
	//y += vsp;
	
	//horizontal collision
		if (place_meeting(x+hsp,y,oCollide))
		{
			while (!place_meeting(x+sign(hsp),y,oCollide))
			{
				x = x + sign(hsp)
			}
			hsp = 0;
			vsp = -4;
		}
	x = x + hsp;
	
	lineOfSight(false,viewRange);
	if instance_exists(target){ if collision_circle(x,y,viewRange,target,0,0) {inView = true}else{inView = false}};
	
	state();
}