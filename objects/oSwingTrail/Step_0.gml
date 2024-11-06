/// @description Insert description here
// You can write your code in this editor


var dist = lerp(0,oMultiWeapon.length*2,0.5);

if instance_exists(owner)
{
	image_angle = owner.image_angle;
	x+= lengthdir_x(dist/spd,owner.image_angle);
	y+= lengthdir_y(dist/spd,owner.image_angle);
	
}
else
{
	spd++;
	image_alpha -= 0.05;
	x+= lengthdir_x(dist/spd,image_angle);
	y+= lengthdir_y(dist/spd,image_angle);
	image_xscale = max(0.5,image_xscale*0.95);
	image_yscale = max(0.5,image_yscale*0.95);
}

if image_alpha < 0 instance_destroy();


