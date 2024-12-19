/// @description Insert description here
// You can write your code in this editor

if instance_exists(oRoomDetect)
{
	myRoom = instance_nearest(x,y,oRoomDetect);
}else myRoom = noone;

done = false;

origin = y;
destination = 72;

doorClosed = false;

myWall = instance_create_layer(x,y,layer,oCollideMiddle);
myWall.image_alpha = 0;

with (myWall)
{
	owner = other.id;
	image_xscale = (other.sprite_width / sprite_width)-2;
	image_yscale = other.sprite_height / sprite_height;
}

acc = 0;