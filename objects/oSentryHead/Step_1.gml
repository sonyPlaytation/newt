/// @description Insert description here
// You can write your code in this editor

if iFrames > 0 {iFrames--};

if hp <= 0 or !instance_exists(owner)
{
	instance_create_depth(x,y,depth,oExplosion);
	instance_destroy();
}

if keyboard_check_pressed(ord("5"))
{
	instance_create_depth(x,y,depth,oExplosion);
	with instance_create_depth(x,y,depth-20,oPistAmmoPickup){vsp -= 5;}
	instance_destroy();
}