
if instance_exists(oWeaponPickup)
{
	nearestWeapon = instance_nearest(x,y,oWeaponPickup);
	
	nearestWeapon.active = true;	
}

global.newtCenter = y-22;

//reset exclamation marker by default
exclam = false; 

//decrease iframes always
if (iFrames > 0) iFrames--;

//debug take damage
if keyboard_check_pressed(vk_backspace) {playerHit(1)};

//reset flash shader
flash--;

//if in room, set vars
if instance_exists(oRoomDetect) and !place_meeting(x,y,oRoomDetect) {inRoom = false; oCamera.follow = oNewt};

#region control keys

if (hasControl){generalFunctions()}
else
{
	//key_left = 0;	//this is so stupid
	//key_right = 0;
	//key_up = 0;
	//key_down = 0;

	//key_stomach = 0;
	//key_spit = 0;

	//key_fire = 0;
	//key_altFire = 0;

	//key_jump = 0;
	
	//key_scrup = 0;
	//key_scrown = 0;
}

//give ammo DEBUG
if input_check_pressed("special")
	{ 
		getAmmo();
		audio_play_sound(snHL1Pickup,999,false);
		global.hasCrit = true;
		global.soda[0] = true;
	} 

#endregion 

//pause self
if instance_exists(oHstop)
{
	image_speed = 0;
	exit;
}
else
{
	image_speed = 1;
}

if input_check_pressed("inspect") and !instance_exists(myInfo)
{
	myInfo = instance_create_depth(x,y,depth-1,oInfoText);
	with myInfo
	{
		active = 1;
		owner = oNewt;
	}	
}

if bloodMeter >= bloodMax
{
	flash = 16;
	audio_play_sound(snGULP,450,false,5);
	playerHeal(1);	
	bloodMeter -= bloodMax;
}

if place_meeting(x,bbox_top-1,oCollide)
{
	for (var i=0; i<1000; i++)
	{
		//right
		if (!place_meeting(x+i, y, oCollide)){x+=i;break;}
		//left
		if (!place_meeting(x-i, y, oCollide)){x-=i;break;}
		//up
		if (!place_meeting(x, y-i, oCollide)){y-=i;break;}
		//down
		if (!place_meeting(x, y+i, oCollide)){y+=i;break;}
	}
}

state();

#region move calc

////sprint toggle
//if key_autoRun {global.autoRun = !global.autoRun};
////sprint
//if (global.autoRun) or (key_run)  {moveType = 1; image_speed = 10} else {moveType = 0; image_speed = 1};

////calculate horizontal movement
//wallJumpDelay = max(wallJumpDelay-1,0);
//if (wallJumpDelay ==0)
//{
//	var dir = key_right - key_left;
//	hsp += dir * hspAcc[moveType];
	
//	if (dir == 0)
//	{
//		var hspFricFinal = hspFricGround;
//		if (!onGround) hspFricFinal = hspFricAir;
//		hsp = approach(hsp,0,hspFricFinal);
//	}
//	hsp = clamp(hsp,-hspWalk[moveType],hspWalk[moveType]);
//}

////wall jump stuff
//if (onWall != 0) && (!onGround) && (key_jump)
//{
//	wallJumpDelay = wallJumpDelayMax;
//	hsp = -onWall * hspWJump;
//	vsp = vspWJump;
//	oSFX.newtjump = true;
//	hspFrac = 0;
//	vspFrac = 0;
	
//	repeat(6)
//		{
//			with (instance_create_layer(x,bbox_top, "Player", oSlime))
//			{
//				hsp =  random_range(oNewt.hsp/2, oNewt.hsp);
//				vsp = random_range(-1,-5);
//				image_speed = slimeDecay;
//			}		
//		}
//}

////calculate vertical movement
//var grvFinal = grv;
//var vspMaxFinal = vspMax;
//if (onWall != 0) && (vsp > 0)
//{
//	oSFX.wallslidesound = true;

//	grvFinal = grvWall;
//	vspMaxFinal = vspMaxWall;	
//}
//vsp += grvFinal;

////ground jumping

////reset double jump
//if onGround
//{
//jumpCount = 0;	
//jumpHoldTimer = 0;
//}
//else
//{
// if jumpCount == 0 {jumpCount = 1};	
//}

//jumpBuffer--;
//if(jumpKeyBuffered) and (jumpCount < jumpMax)
//{
//	jumpBuffer = 0;
//	jumpKeyBuffered = false;
//	jumpKeyBufferTimer = 0;
		
//	jumpCount++;
		
//	////set the jump hold timer
//	jumpHoldTimer = jumpHoldFrames[jumpCount-1];
		
//	audio_play_sound(snSquish8,500,false);
//	audio_sound_pitch(snSquish8,random_range(0.8,1.2));
		
//	repeat(6)
//	{
//		with (instance_create_layer(x,bbox_bottom, "Player", oSlime))
//		{
//			hsp = random_range(oNewt.hsp/2, oNewt.hsp);
//			vsp = random_range(oNewt.vsp/2, oNewt.vsp);
//			image_speed = slimeDecay;
//		}		
//	}
//}
////jump based on hold button
//if jumpHoldTimer > 0
//{
//	vsp = vspJump[jumpCount-1];
//	vspFrac = 0;
//	jumpHoldTimer--;	
//}
	
//	if !key_jump_held
//{
//	jumpHoldTimer = 0;	
//}
	
//vsp = clamp(vsp,-vspMax,vspMax);
////}

////dump fractions and get final integer speeds
//hsp += hspFrac;
//vsp += vspFrac;
//hspFrac = frac(hsp);
//vspFrac = frac(vsp);
//hsp -= hspFrac;
//vsp -= vspFrac;

////horizontal collision
//	var subpixel = .5;

//if (place_meeting(x+hsp,y,oCollide))
//{
//	var onepixel = sign(hsp);
	
//	//first check if theres slope or not
//	if !place_meeting( x + hsp, y - abs(hsp)-1.5, oCollide)
//	{
//		while (place_meeting(x+hsp,y,oCollide))	{y -= subpixel}
//	}
//	else
//	{
//		//ceiling slopes
//		if !place_meeting(x + hsp, y + abs(hsp)+1, oCollide) 
//		{
//			while place_meeting(x+hsp, y, oCollide) {y+= subpixel};
//		}
//		//normal x collide
//		else
//		{
//			var pixelcheck = subpixel*sign(hsp);
//			while (!place_meeting(x+pixelcheck,y,oCollide)) x += pixelcheck;
		
//			hsp = 0;
//			hspFrac = 0;	
//		}	
//	}
//}

////go down slopes
//if (vsp >= 0) and !place_meeting (x + hsp, y+1, oCollide) and place_meeting(x+hsp, y+abs(hsp)+1.5, oCollide)
//{
//	while !place_meeting(x +hsp, y+ subpixel, oCollide){y+= subpixel};
//}

////horizontal move
//x += hsp;

////vertical collision
//if (place_meeting(x,y+vsp,oCollide))
//{
//	var onepixel = sign(vsp);
//	var pixelcheck = subpixel*sign(vsp);
	
//	while (!place_meeting(x,y+pixelcheck,oCollide)) y += pixelcheck;
	
//	//bonk code
//	if (vsp < 0){jumpHoldTimer = 0; oSFX.mariobump = true};
	
//	vsp = 0;
//	vspFrac = 0;
//}

////vertical move
//y += vsp;

////calc current status
//onGround = place_meeting(x,y+1,oCollide);
//onWall = place_meeting(x+1,y,oCollide) - place_meeting(x-1,y,oCollide);
//if (onGround) jumpBuffer = 10;



#endregion








