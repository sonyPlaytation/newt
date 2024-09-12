/// @description Insert description here
// You can write your code in this editor

image_speed = random_range(0.4,0.8);
image_index = random_range(0,2);
hsp = 0;
vsp = 0;
image_xscale = choose(1,-1);
image_yscale = choose(1,-1);

jump = false;

slimeDecay = 0.2;

if (instance_exists(oNewt)) depth = oNewt.depth-10;