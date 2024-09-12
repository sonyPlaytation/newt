/// @description Insert description here
// You can write your code in this editor

image_speed = random_range(0.8,1.3);
image_index = random_range(0,2);

hsp = 0;
vsp = 0;

image_xscale = -2;
image_yscale = 2;

sparkDecay = 0.2;

if (instance_exists(oNewt)) depth = oNewt.depth-10;