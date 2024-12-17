/// @description Insert description here
// You can write your code in this editor

event_inherited();

image_speed = random_range(0.4,0.8);
image_index = random_range(0,2);

if instance_exists(oNewt)
{
	vsp = oNewt.vsp*3
	hsp = oNewt.hsp*2
}

image_xscale = choose(1,-1);
image_yscale = choose(1,-1);

jump = false;

slimeDecay = 0.2;

if (instance_exists(oNewt)) depth = oNewt.depth-10;

color = #31DE93;