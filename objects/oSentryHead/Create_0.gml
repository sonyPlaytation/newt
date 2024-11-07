/// @description Insert description here
// You can write your code in this editor

event_inherited();


if instance_exists(oRoomDetect)
{
	myRoom = instance_nearest(self.x,self.y,oRoomDetect);
}else {myRoom = noone;}

selfCenter = y-14;
restAng = 0;
inSight = 0;

shotReset = 15;
shotTimer = shotReset;
damage = 25;

maxHP = 8;
hp = maxHP;
maxAmmo = 20;
ammo = maxAmmo;

if place_meeting(x,selfCenter,oCollide)
{
	instance_create_depth(x,y,depth,oExplosion);
	instance_destroy();
}