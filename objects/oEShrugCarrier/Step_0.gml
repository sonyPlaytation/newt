/// @description Insert description here
// You can write your code in this editor

//screen pause
if screenPause() {exit;};



if instance_exists(myRoom)
{
	if myRoom.roomActive {inactive = false} else inactive = true;
}

hsp = image_xscale;

//horizontal collision
		if (place_meeting(x+hsp,y,oCollide))
		{
			while (!place_meeting(x+sign(hsp),y,oCollide))
			{
				hsp += sign(hsp);
			}
			
			image_xscale = -image_xscale;
		}

		x = x + hsp;
	
	//vertical collision

		vsp = -1;

		
		if (collision_line(x,y,x,y-44,oCollide,0,0))
		{
			vsp = 0;
			onCeiling = true;
			
		}else onCeiling = false;
		
		y = y +vsp

if instance_exists(oNewt) and !inactive
{
	
	if collision_line (x,y, oNewt.x, global.newtCenter, oCollide, 1, 0)	{cantSee = true} else cantSee = false;
	
	if point_in_circle(x,y, oNewt.x, global.newtCenter, viewRange)			{inRange = true} else inRange = false;


}