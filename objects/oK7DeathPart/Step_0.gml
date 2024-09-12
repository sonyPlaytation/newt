/// @description Insert description here
// You can write your code in this editor

spd /= decel;

hsp = lengthdir_x(spd, dir);
vsp = lengthdir_y(spd, dir);

x += hsp;
y += vsp;

if done == true
{
	image_alpha -= 0.02;	
}



if image_alpha < 0.1
{
	instance_destroy();	
}