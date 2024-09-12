/// @description Insert description here
// You can write your code in this editor

if instance_exists(owner)
{
	x = owner.x + lengthdir_x(200,owner.image_angle);
	y = owner.y + lengthdir_y(200,owner.image_angle);
}else instance_destroy();

if global.inputdevice = "keyboard_and_mouse"{image_alpha = 0} else image_alpha = 1;