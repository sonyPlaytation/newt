/// @description Insert description here
// You can write your code in this editor

diedFrom = noone;
corpse = oDWalker;

if instance_exists(oRoomDetect)
{
	myRoom = instance_nearest(self.x,self.y,oRoomDetect);
	
}else {myRoom = noone;}

patrolReset = 60;
patrolTime = patrolReset;

waitReset = 120;
waitTime = waitReset;

facingRight = 1;
viewRange = 500;
nearRange = 150;
flipTimeReset = 30;
flipTime = flipTimeReset;
confusion = 40;
cantShoot = false;
att = 60;
markerTime = 30;
image_xscale = 1;
hasWeapon = true;

diedFrom = "standard";

runsprite = sECrocRunA;
mouthopen = false;

enum crocstates {
patrol,
alert,
confused
	
}



state = crocstates.patrol;



if(hasWeapon)
{
	mygun = instance_create_layer(x,y,"Weapon",oWandCroc);
	with (mygun)
	{
		owner = other.id;
		viewRange = owner.viewRange;
	}
}
else mygun = noone;

if (hasHead)
{
	myHead = instance_create_depth(x,bbox_top,depth-10,oHeadHitbox)
	with myHead {owner = other.id; width = 2;};
}
else myHead = noone;