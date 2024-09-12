/// @description Insert description here
// You can write your code in this editor

if instance_exists(oNewt) 
{
	depth = oNewt.depth + 10;
	if (round(oNewt.bbox_bottom > y)) or (oNewt.key_down) {mask_index = -1}
	else mask_index = sCollDestructo;
	
	if collision_circle(x,y,15,oECroc,0,0)
	{
		alarm[0] = 1;	
	}
	
	if place_meeting(x,y-1,oNewt)
		{
			alarm[0] = 15;
	
	}
	
	
}




