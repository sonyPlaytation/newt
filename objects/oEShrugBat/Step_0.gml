/// @description Insert description here
// You can write your code in this editor


//screen pause
if screenPause() {exit;};

if collision_circle(x,y,25,oEShooter,1,1)
{
	myGoon = instance_nearest(x,y,oEShooter);
	
	with myGoon
	{
		owner = other.id;
		carried = true;
	}
}

if instance_exists(myGoon) {hasGoon = true} else {hasGoon = false}

if instance_exists(myRoom)
{
	if myRoom.roomActive {inactive = false} else inactive = true;
}

		//horizontal collision
		if (place_meeting(x+hsp,y,oCollide))
		{
			while (!place_meeting(x+sign(hsp),y,oCollide))
			{
				hsp += sign(hsp);
			}
			hsp = -hsp;
			image_xscale = -image_xscale;
		}
		
		if hasGoon
		{
			if (place_meeting(myGoon.x+hsp,myGoon.y,oCollide))
			{
				while (!place_meeting(myGoon.x+sign(hsp),myGoon.y,oCollide))
				{
					hsp += sign(hsp);
				}
				hsp = -hsp;
				image_xscale = -image_xscale;
			}
		}
		x = x + hsp;
	
	//vertical collision
		
		if (place_meeting(x,y+vsp,oCollide))
		{
			vsp = -1;
		}
		
		if (collision_line(x,y,x,y-44,oCollide,0,0))
		{
			vsp = 0;
			onCeiling = true;
			
		}else onCeiling = false;
		
		y = y +vsp

if instance_exists(oNewt) and !inactive
{
	var statenext = -1;
	

	if !hasGoon
	{
		var distToNewt = distance_to_object(oNewt);
		var distToGoon = distance_to_object(instance_nearest(x,y,oEShooter));
	
		if distToNewt > distToGoon{target = instance_nearest(x,y,oEShooter)}else {target = oNewt}
	
		if collision_line (x,y, target.x, target.y-22, oCollide, 1, 0)	{cantSee = true} else cantSee = false;
	
		if point_in_circle(x,y, target.x, target.y-22, viewRange)		{inRange = true} else inRange = false;
	}
	state();

}else 
{
	sprite_index = sEShrugBatIdle;
	hsp = 0;
	vsp = -1;
	
}