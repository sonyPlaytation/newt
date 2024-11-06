/// @description Insert description here
// You can write your code in this editor

inactive = false;
diedFrom = noone;
corpse = "bat";
cSprite = sEShrugBatDie;
big = false;
mygun = noone;

myDamage = instance_create_layer(x,y,"GUI",oDmgNum);
with (myDamage)
{
	owner = other.id		
}

if instance_exists(oRoomDetect)
{
	myRoom = instance_nearest(self.x,self.y,oRoomDetect);
	
}else {myRoom = noone;}

selfCenter = y-10;
viewRange = 270;
idleReset = 60;
idleTimer = idleReset;
flyReset = 60;
flyTimer = flyReset;
inRange = false;
swoopAngle = 0;
swoopSpeed = 7
swoopReset = 10;
swoopTime = swoopReset;
done = false;

goonHP = 0;

if (instance_exists(oNewt) and oNewt.x< x) {image_xscale = -1};

myShooter = instance_create_depth(x,y+22,depth,oEShooterCarried);
with myShooter 
{
	owner = other.id
	
};

if(hasWeapon)
{
	mygun = instance_create_layer(x,y,"Weapon",oWandEnemy);
	with (mygun)
	{
		owner = other.id;
		countdownRate = 30;
		setspeed = 15;
		viewRange = owner.viewRange;
	}
}
else mygun = noone;