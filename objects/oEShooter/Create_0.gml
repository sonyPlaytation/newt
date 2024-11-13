/// @description Insert description here
// You can write your code in this editor

//corpse
corpse = "generic"
cSprite = sEShooterDie;
big = false;
diedFrom = noone;
friendly = -1;
target = noone;

drop = oHealthPickup;
dropChance = 5;

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

if(hasWeapon)
{
	mygun = instance_create_depth(x,y,depth-100,oWandEnemy);
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

statePatrol = function()
{
	lineOfSight(false,viewRange);
		
	if instance_exists(target)
	{
		vsp = -3; 
		state = stateAlert;
		att = 60;
		oSFX.whatwasthatnoise = true;
		markerTime = 30;
	}

	//dont walk off ledges
	if (!place_meeting(x+(hsp*3), y+1, oCollide))
	{
		patrolTime = 0;
	}
	
	vsp = vsp + grv;
				
	sprite_index = sEShooterWalk;
	image_speed = 1;
	image_xscale = sign(hsp);
	
	//vertical collision
		
	if (place_meeting(x,y+vsp,oCollide))
	{
		while (!place_meeting(x,y+sign(vsp),oCollide))
		{
			y += sign(vsp);
		}
		vsp = 0;
		grounded = true;
	}
	y += vsp;
	
	//horizontal collision
	if (place_meeting(x+hsp,y,oCollide))
	{
		while (!place_meeting(x+sign(hsp),y,oCollide))
		{
			x = x + sign(hsp)
		}
		hsp = -hsp;
		patrolTime = patrolReset;
	}
	x = x + hsp;
	
	patrolTime--;
	if (patrolTime <= 0)
	{
		patrolTime = patrolReset;
		hsp = -hsp;
	}
	

	
}

stateAlert = function()
{
	walksp = 0;
		
	lineOfSight(false,viewRange);
	if !instance_exists(target) 
	{
		att--;
	}
	else if (target.x < x){image_xscale = -1} else image_xscale = 1;
	
	if (att <= 0)
	{	
		mygun.countdown = irandom_range(30,60);
		hsp = image_xscale; 
		patrolTime = patrolReset;  
		state = statePatrol;
	}
	
	vsp = vsp + grv;
	if (markerTime > 0){image_speed = 0; sprite_index = sEShooterWTF}else{image_speed = 1; sprite_index = sEShooter};
	markerTime--;
	
	if (place_meeting(x,y+vsp,oCollide))
	{
		while (!place_meeting(x,y+sign(vsp),oCollide))
		{
			y += sign(vsp);
		}
		vsp = 0;
		grounded = true;
	}				
	y += vsp;
	
}

state = statePatrol