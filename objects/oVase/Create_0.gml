/// @description Insert description here
// You can write your code in this editor

event_inherited();

if instance_exists(oRoomDetect)
{
	myRoom = instance_nearest(self.x,self.y,oRoomDetect);
	
}else {myRoom = noone;}

multiplier = choose(3,3,3,3,10);

inactive = false;

fragile = true;