/// @description Insert description here
// You can write your code in this editor

myWall = noone;


vsp = 0;
grv = 0.3;

multiplier = choose(3,3,3,3,10);

inactive = false;

image_xscale = oDummy.image_xscale;

myDamage = instance_create_layer(x,y,"GUI",oDmgNum);
with (myDamage)
{
	owner = other.id		
}

if (hasHead)
{
	myHead = instance_create_depth(x,bbox_bottom,depth-10,oHeadHitbox)
	with myHead {owner = other.id};
}
else myHead = noone;