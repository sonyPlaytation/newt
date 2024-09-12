/// @description Insert description here
// You can write your code in this editor

turnRadius+=0.25;

if instance_exists(oNewt){homingtarget = oNewt}else homingtarget = noone

	var targetdir = point_direction(x,y,homingtarget.x,homingtarget.y-homingtarget.sprite_height/2)
	dir += sin(degtorad(targetdir-dir))*turnRadius;
		
	image_angle = dir;
	xspd = lengthdir_x(spd, dir);
	yspd = lengthdir_y(spd, dir);

	x += xspd;
	y += yspd;


