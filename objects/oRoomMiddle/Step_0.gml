/// @description Insert description here
// You can write your code in this editor

var i = irandom(array_length(reward)-1);

floorBelow = instance_nearest(x,y+48,oCollide);

if !owner.roomEnemies and !owner.rewardGranted
{
	repeat(8)
	{
		with instance_create_depth(x,y,depth,oDust)
		{
			dir = other.dustAng
		}
		dustAng += 45;
	}
	
	owner.rewardGranted = true;
	
	with instance_create_depth(x,floorBelow.bbox_top,depth,reward[i])
	{
		vsp = -7	
	}
	var rng = irandom(99);
	if rng >= 78
	{
		var i = irandom(array_length(reward)-1);
		instance_create_depth(x+24,floorBelow.bbox_top,depth,reward[i])
	}
}
