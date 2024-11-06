/// @description Insert description here
// You can write your code in this editor

if instance_exists(oRoomDetect)
{
	myRoom = instance_nearest(self.x,self.y,oRoomDetect);
	
}else {myRoom = noone;}

headY = y-16;

myHead = instance_create_depth(x,headY,depth-10,oSentryHead);
with myHead
{
	owner = other.id;
	image_xscale = owner.image_xscale;
}

vsp = 0;
grv = 0.3;

