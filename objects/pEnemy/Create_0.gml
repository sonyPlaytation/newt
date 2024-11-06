/// @description Insert description here
// You can write your code in this editor

diedFrom = noone;
corpse = "generic";
cSprite = sEWalkerDie;
big = false;
friendly = -1;

global.getSizeKilled = 1;
if instance_exists(oRoomDetect)
{
	myRoom = instance_nearest(self.x,self.y,oRoomDetect);
	
}else {myRoom = noone;}


if(hasWeapon)
{
	mygun = instance_create_layer(x,y,"Weapon",oWandEnemy);
	with (mygun)
	{
		owner = other.id;
	}
}
else mygun = noone;

if (hasHead)
{
	myHead = instance_create_depth(x,bbox_top,depth-10,oHeadHitbox)
	with myHead {owner = other.id};
}
else myHead = noone;

