/// @description Insert description here
// You can write your code in this editor

diedFrom = noone;
corpse = "generic";
cSprite = sEWalkerDie;
big = false;
friendly = -1;

swapTimeReset = 35;
swapTime = swapTimeReset;

tellTimeReset = 30;
tellTime = tellTimeReset;

stt = "";
sprite = sMaynerd;

global.getSizeKilled = 1;
if instance_exists(oRoomDetect)
{
	myRoom = instance_nearest(self.x,self.y,oRoomDetect);
	
}else {myRoom = noone;}

if (hasHead)
{
	myHead = instance_create_depth(x,bbox_top,depth-10,oHeadHitbox)
	with myHead {owner = other.id};
}
else myHead = noone;

stateIdle = function()
{
	stt = "idle"
	
	//vertical collision
	if (place_meeting(x,y+vsp,oCollide)) or (place_meeting(x,y+vsp,oCollSemi))
	{
		while (!place_meeting(x,y+sign(vsp),oCollide)) and (place_meeting(x,y+vsp,oCollSemi))
		{
			y += sign(vsp)
		}
		vsp = 0;
	}
	y += vsp;
	
	image_speed = 1;
	
	if swapTime <= 0
	{
		var stateNext = irandom(1) 
		
		switch (stateNext)
		{
			case 0: // Dash
			
				dashFloat = choose(true,false);
				tellTime = tellTimeReset;
				swapTime = swapTimeReset;
				image_index = 0;
				state = stateDash;
				
			break;
			
			case 1: // Dash
			
				tellTime = 60;
				swapTime = irandom_range(2,5) * 60;
				image_index = 0;
				state = stateThrow;
				
			break;
			
<<<<<<< HEAD
=======
			case 2: // Jump
			
				tellTime = 15;
				swapTime = 45;
				hsp = 3*facing;
				state = stateSquat;
				jumpCount = 3;
				
			break;
			
>>>>>>> parent of ae49108 (finished boss death animation)
		}
		
	}
	swapTime--;
	
	sprite = sMaynerd;
	if instance_exists(oRoomMiddle) {if oRoomMiddle.x < x {image_xscale = -1;} else image_xscale = 1};
}

stateChop = function()
{
	stt = "Chop"
}

stateDash = function()
{
	stt = "dash"
	
	sprite = sMaynerdDash;
	vsp = -0.35;
	y += vsp
	
	if tellTime <= 0
	{
		flash = 0;
		
		vsp = 0;
		walksp = 3;
		hsp += walksp*image_xscale;
	
		x+= hsp;
		
		if abs(hsp) >= 2
		{
			repeat (25) 
			{
				with instance_create_depth(x,y,depth+100,oDust)
				{
					grow = 1.1;
					vsp = -2;
				}
			}
		};
	
		//horizontal collision
		if (place_meeting(x+hsp,bbox_top,oCollide))
		{
			while (!place_meeting(x+sign(hsp),y,oCollide))
			{
				x = x + sign(hsp)
			}
			
			with instance_create_layer(oRoomMiddle.x,oRoomDetect.bbox_top,"Player", oVase){dropRate = 50; ghostChance = 0;};
			
			screenShake(30,20);
			oSFX.explode = snExplosion;
			hsp = -hsp/5;
			vsp = -7;
			state = stateCrash;
			tellTime = tellTimeReset;
			swapTime = 30;
		}
	}
	
	tellTime--;
	if tellTime <=10 {flash = 3;}
	
}

stateWalk = function()
{
	stt = "walk"
	
	vsp = vsp + grv;
}

stateJump = function()
{
	stt = "jump"
}

stateCrash = function()
{
	sprite = sMaynerdAir;
	hsp *= 0.9
	
	//horizontal collision
	if (place_meeting(x+hsp,bbox_top,oCollide))
	{
		while (!place_meeting(x+sign(hsp),y,oCollide))
		{
			x = x + sign(hsp)
		}
		hsp = 0;
	}
	x += hsp

	//vertical collision
	if (place_meeting(x,y+vsp,oCollide)) or (place_meeting(x,y+vsp,oCollSemi))
	{
		while (!place_meeting(x,y+sign(vsp),oCollide)) and (place_meeting(x,y+vsp,oCollSemi))
		{
			y += sign(vsp)
		}
		vsp = 0;
		swapTime--;
	}
	y += vsp;
	
	if swapTime <= 0
	{
		swapTime = swapTimeReset*2;
		state = stateIdle
	}
}

stateThrow = function()
{
	stt = "throw"
	
	sprite = sMaynerdThrow;
	
	if image_index == 1
	{
		instance_create_layer(x,bbox_top,"Player",oMaynerdAxe);
		image_speed = 2
	}
		
	swapTime--;
	if swapTime <= 0 
	{
		state = stateIdle;
		swapTime = swapTimeReset;
	};
	
}

state = stateIdle;