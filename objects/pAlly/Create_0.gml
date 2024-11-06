/// @description Insert description here
// You can write your code in this editor

//friendly	1
//neutral	0
//enemy	   -1
friendly = 1;
target = noone;
diedFrom = noone;
iFramesReset = 30;
iFrames = iFramesReset;
flash = 0;

if instance_exists(oRoomDetect)
{
	myRoom = instance_nearest(self.x,self.y,oRoomDetect);
}else {myRoom = noone;}

vsp = 0;
hsp = 0;


