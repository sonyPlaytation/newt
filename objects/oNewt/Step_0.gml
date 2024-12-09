
global.newtCenter = y-22;
if (iFrames > 0) iFrames--;									//decrease iframes always
exclam = false;												//reset exclamation marker by default
//if keyboard_check_pressed(vk_backspace) {playerHit(1)};	//debug take damage
flash--;													//reset flash shader

if (hasControl){generalFunctions()}

if instance_exists(oWeaponPickup)
{
	nearestWeapon = instance_nearest(x,y,oWeaponPickup);
	
	nearestWeapon.active = true;	
}

//if in room, set vars
if instance_exists(oRoomDetect) and !place_meeting(x,y,oRoomDetect) {inRoom = false; oCamera.follow = oNewt};

sprSPD = 1*oInv.spdMod;

//pause self
if instance_exists(oHstop)
{
	sprSPD = 0;
	exit;
}
else
{
	sprSPD = 1;
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

if godmode = true{iFrames = 10; flash = 10;}

if dashTrail > 0
{
	dashTrail--;
	with instance_create_depth(x,y,depth+100,oCloneTrail)
	{
		owner = other.id; 
		col=c_aqua; 
		add = true;
		blink = true;
		xFrames = 2;
		xReset = xFrames;
	};	
}

if (hasControl) 
{
	state();
	if propBuffer > 0 {propBuffer--};
} 
else
{
	//sprSPD = 0;
	if inspect
	{
		sprite_index = sNewtRear;
	}
}

