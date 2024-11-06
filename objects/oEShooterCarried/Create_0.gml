/// @description Insert description here
// You can write your code in this editor

inactive = false;
corpse = "generic"
cSprite = sEShooterDie;
diedFrom = noone;

myDamage = instance_create_layer(x,y,"GUI",oDmgNum);
with (myDamage)
{
	owner = other.id		
}

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

enum carriedstates {
patrol,
alert,
confused
	
}

state = carriedstates.patrol;

if(hasWeapon)
{
	mygun = instance_create_layer(x,y,"Weapon",oWandEnemy);
	with (mygun)
	{
		owner = other.id;
		countdownRate = 45;
		setspeed = 9;
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