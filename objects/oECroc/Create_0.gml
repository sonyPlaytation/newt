/// @description Insert description here
// You can write your code in this editor

event_inherited();

diedFrom = noone;
corpse = "generic";
cSprite = sECrocDie
big = true;

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
rot = 0;

diedFrom = "standard";

runsprite = sECrocRunA;
mouthopen = false;

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

statePatrol = function()
{
	
	lineOfSight();
	if instance_exists(target)
	{
		hsp = 0;
		vsp = -3; 
		state = stateAlert;
		oSFX.whatwasthatnoise = true;
		att = 60;
		markerTime = 30;
	}	
	
	image_speed = 1;
	if hsp != 0 {sprite_index = runsprite};
	if image_xscale = 1{mygun.image_angle = 0}else mygun.image_angle = 180;
			
	att = 120; 
	markerTime = 30;
	
	//dont walk off ledges
	if (grounded) && (stayonledges) && (!place_meeting(x+hsp, y+1, oCollide))
	{
			hsp = -hsp;	
			patrolTime = patrolReset;
			image_xscale = -image_xscale;
	}
	vsp = vsp + grv;
				
	patrolTime--;
	if (patrolTime < 0)
	{
		waitTime--
		hsp = 0;
		sprite_index = sECroc;
		if waitTime < 0
		{
			waitTime = waitReset;
			patrolTime = patrolReset;
			image_xscale = -image_xscale;
			hsp = image_xscale;
		}
	}
}

stateAlert = function()
{
	//horizontal collision
	if (place_meeting(x+hsp,y,oCollide))
	{
		while (!place_meeting(x+sign(hsp),y,oCollide))
		{
			x = x + sign(hsp)
		}
		hsp = 0;
	}
	walksp = runsp;
	image_speed = 1.5;
	vsp = vsp + grv;
	rot = -hsp*1.5;
	image_angle = rot;
				
	if (markerTime > 0){sprite_index = sECrocWTF} else {sprite_index = runsprite};
	
	lineOfSight();
	if instance_exists(target)
	{ 
		if hsp !=0 {sprite_index = runsprite}
		
		if collision_circle(x,y,nearRange,oNewt,0,0) {inRange = true}else{inRange = false};
		if !inRange
		{
			mouthopen = false;
			hsp = walksp*image_xscale;
		}else //if inRange is true
		{
			mouthopen = true;
		}
	}
				
	markerTime--;
	
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

	if (oNewt.x < x){image_xscale = -1} else image_xscale = 1;
	
	if (!place_meeting(x,y+1,oCollide))
	{
		grounded = false;
		sprite_index = sECrocJump;
		image_speed = 0;
		if (sign(vsp) > 0) image_index = 1; else image_index = 0;
	}
			
	if !cantShoot {att--;};
	if (att <= 0)
	{	
		hsp = image_xscale; 
		patrolTime = patrolReset;  
		state = statePatrol;			
	}
}

state = statePatrol;