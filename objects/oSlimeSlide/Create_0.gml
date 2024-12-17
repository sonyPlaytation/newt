/// @description Insert description here
// You can write your code in this editor


event_inherited();

lengthMatters = false;
size = 2.5;

if instance_exists(oNewt)
{
	vsp = oNewt.vsp*2
	hsp = oNewt.onWall * 2
}

image_speed = random_range(0.4,1);
image_index = random_range(0,1);

color = #31DE93;