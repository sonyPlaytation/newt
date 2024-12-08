/// @description Insert description here
// You can write your code in this editor

diedFrom = noone;
corpse = "generic";
cSprite = sEWalkerDie;
big = false;
friendly = -1;

expReset = 30;
expTimer = 0;
expCount = 0;

swapTimeReset = 35;
swapTime = swapTimeReset;

tellTimeReset = 30;
tellTime = tellTimeReset;

facing = -1;
jumpCount = 0;
phase = 0;

maxHP = hp;
horseUsed = false;

stt = "";
sprite = sMaynerd;

instance_create_layer(x,y,layer,oBossHealth);

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


// states

stateIdle = function()
{
	stt = "idle"
	
	//vertical collision
	if (place_meeting(x,y+vsp,oCollide))
	{
		while (!place_meeting(x,y+sign(vsp),oCollide))
		{
			y += sign(vsp)
		}
		vsp = 0;
		grounded = true;
	}
	y += vsp;
	
	image_speed = 1;
	
	if swapTime <= 0 and grounded and !instance_exists(oProjectileHorse)
	{
		if phase == 1
		{
			var stateNext = irandom(2);
		
			switch (stateNext)
			{
				case 0: // Dash
				
					dashFloat = choose(true,false);
					tellTime = tellTimeReset;
					swapTime = swapTimeReset;
					image_index = 0;
					state = stateDash;
				
				break;
			
				case 1: // Throw
					if prevState != stateThrow
					{
						tellTime = 90;
						swapTime = irandom_range(2,5) * 60;
						image_index = 0;
						state = stateThrow;
					}
				break;
			
				case 2: // Jump
					if prevState != stateJump
					{
						tellTime = 15;
						swapTime = 45;
						hsp = 3*facing;
						state = stateSquat;
						jumpCount = 3;
					}
				break;
			}
		}
		else if phase = 2
		{
			
			
			var stateNext = irandom(2);
		
			switch (stateNext)
			{
				case 0: // Horse
					if !horseUsed
					{
						tellTime = 45;
						swapTime = 240;
						state = stateHorse;
					}
				break;
			
				case 1: // Throw
					if prevState != stateThrow
					{
						tellTime = 90;
						swapTime = irandom_range(2,5) * 60;
						image_index = 0;
						state = stateThrow;
					}
				break;
			
				case 2: // Jump
					if prevState != stateJump
					{
						tellTime = 15;
						swapTime = 45;
						hsp = 3*facing;
						state = stateSquat;
						jumpCount = 3;
					}
				break;
			}
			
			
		}
	}
	if grounded {swapTime--}
	sprite = sMaynerd;
	if instance_exists(oRoomMiddle) {if oRoomMiddle.x < x {image_xscale = -1;} else image_xscale = 1};
}

stateHorse = function()
{
	prevState = stateHorse;
	stt = "Horse"
	
	tellTime--;
	if tellTime == 0
	{
		with instance_create_layer(x+(facing*50),y-(sprite_height/2),"Shots",oProjectileHorse)
		{
			if other.facing = -1 {dir = 180}else dir = 0;
		}
		horseUsed = true;
	}
	
	swapTime--;
	if swapTime <= 0 
	{
		state = stateIdle;
		swapTime = swapTimeReset;
		vsp = 0;
	};
	
}

stateDash = function()
{
	prevState = stateDash
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
				with instance_create_depth(x,y,depth+100,oDust){grow = 1.05; vsp = -2;}
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
			hsp = -hsp/7;
			vsp = -7;
			state = stateCrash;
			tellTime = tellTimeReset;
			swapTime = 30;
		}
	}
	tellTime--;
	if tellTime == 15 {flash = 3;}
}

stateCrash = function()
{
	prevState = stateDash;
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

stateSquat = function()
{
	prevState = stateJump;
	stt = "jump"
	
	sprite = sMaynerdSquat;
	
	if swapTime == tellTime {flash = 1;}
	
	swapTime--
	if (swapTime <= 0) and (jumpCount > 0)
	{
		y -= 2;
		vsp = -12;
		state = stateJump;
		swapTime = swapTimeReset;
		tellTime = tellTimeReset *2;
		
	}
	else if jumpCount == 0
	{
		state = stateIdle;
		swapTime = swapTimeReset;
		tellTime = tellTimeReset *2;
	}
}

stateJump = function()
{
	prevState = stateJump;
	sprite = sMaynerdAir;
	
	//horizontal collision
	if (place_meeting(x+hsp,bbox_top,oCollide))
	{
		while (!place_meeting(x+sign(hsp),y,oCollide))
		{
			x = x + sign(hsp)
		}
		hsp = -hsp;
	}
	x += hsp
	
	//vertical collision
	if (place_meeting(x,y+vsp,oCollide)) or (place_meeting(x,y+vsp,oCollSemi))
	{
		while (!place_meeting(x,y+sign(vsp),oCollide)) and (place_meeting(x,y+vsp,oCollSemi))
		{
			y += sign(vsp)
		}
		
		if instance_exists(oNewt)
		{
			pushDistH = min(point_distance(oNewt.x,global.newtCenter,x,y),15);
			pushDistV = min(point_distance(oNewt.x,global.newtCenter,x,y)/6,15);
			pushAng = point_direction(oNewt.x,global.newtCenter,x,y);
			
			with (oNewt)
			{
				onGround = false
				y -= 30;

				hsp -= lengthdir_x(other.pushDistH,other.pushAng);
				vsp -= lengthdir_y(other.pushDistV,other.pushAng);
			}
		}
		
		repeat (20)
		{
			with instance_create_depth(x,y,depth+100,oDust)
			{
				grow = 1.05;
				dir = choose(0,180);
				spd = random_range(3, 7);
			}
		}
		
		screenShake(30,20);
		oSFX.explode = snExplosion;
		
		if instance_exists(oNewt)
		{
			
		}
		
		vsp = 0;
		jumpCount--;
		state = stateSquat;
	}
	y += vsp;
}


stateThrow = function()
{
	prevState = stateThrow;
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
prevState = stateIdle;