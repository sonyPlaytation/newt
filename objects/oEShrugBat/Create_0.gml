/// @description Insert description here
// You can write your code in this editor

inactive = false;
diedFrom = noone;
corpse = "bat";
cSprite = sEShrugBatDie;
big = false;
mygun = noone;

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
target = noone;

if (instance_exists(oNewt) and oNewt.x< x) {image_xscale = -1};

if (hasHead)
{
	myHead = instance_create_depth(x,bbox_top,depth-10,oHeadHitbox)
	with myHead {owner = other.id; width = 1.25;height = 0.8;};
}
else myHead = noone;

stateIdle = function()
{
							
	sprite_index = sEShrugBatIdle;
				
	//if inRange and !cantSee and oNewt.x< x {image_xscale = -1}else image_xscale = 1;
				
	swoopSpeed = 7;
	hsp = 0;
	vsp = -1;
	done = false;

	if collision_line (x,y, x, y-45, oCollide, 1, 0) idleTimer--				
				
	if idleTimer < 0
	{		
		statenext =choose(0,1);
					
		if inRange and !cantSee
		{
			if target.x< x {image_xscale = -1}else image_xscale = 1;
			swoopTime = swoopReset;
			hsp = 0;
			swoopAngle = point_direction(x,y,target.x, target.y);
			state = stateSwoop;
		}
					
		if statenext == 1
		{
			idleTimer = idleReset;
			image_xscale = -image_xscale;
		}
					
		else if statenext == 0
		{
			hsp = image_xscale;
			flyTimer = flyReset;
			state = stateWander;
		}		
	}		
}	

stateWander = function()
{
	if inRange and !cantSee
	{
		swoopTime = swoopReset;
		hsp = 0;
		swoopAngle = point_direction(x,y,target.x, target.y);
		if target.x< x {image_xscale = -1}else image_xscale = 1;
		state = stateSwoop;
	}
				
	flyTimer--
				
	if flyTimer < 0
	{
		statenext = -1;
		state = stateIdle;
	}
}	

stateSwoop = function()
{
	if collision_circle(x,y,20,oCollide,0,0) or place_meeting(x,y,oNewt)
	{	
		idleTimer = idleReset;
		done = true;
		swoopTime = swoopReset;
		statenext = -1;
		state = stateIdle;	
	};
			
	sprite_index = sEShrugBatSwoop;
	x = x + lengthdir_x(swoopSpeed,swoopAngle);
	y = y + lengthdir_y(swoopSpeed,swoopAngle);
			
	if (done == true)
	{
		swoopTime = swoopReset;
		statenext = -1;
		state = stateIdle;		
	}
}		

state = stateIdle;