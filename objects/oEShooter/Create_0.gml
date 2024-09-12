/// @description Insert description here
// You can write your code in this editor

diedFrom = noone;
corpse = oDShooter;

if instance_exists(oRoomDetect)
{
	myRoom = instance_nearest(self.x,self.y,oRoomDetect);
	
}else {myRoom = noone;}

patrolReset = 60;
patrolTime = patrolReset;
facingRight = 1;
viewRange = 500;
flipTimeReset = 30;
flipTime = flipTimeReset;
confusion = 40;
cantShoot = false;
att = 60;
markerTime = 30;
image_xscale = 1;

enum states {
patrol,
alert,
confused
	
}



state = states.patrol;



if(hasWeapon)
{
	mygun = instance_create_depth(x,y,depth-100,oWandEnemy);
	with (mygun)
	{
		owner = other.id;
		countdownRate = 30;
		setspeed = 25;
		viewRange = owner.viewRange;
	}
}
else mygun = noone;

if (hasHead)
{
	myHead = instance_create_depth(x,bbox_top,depth-10,oHeadHitbox)
	with myHead {owner = other.id};
}
else myHead = noone;