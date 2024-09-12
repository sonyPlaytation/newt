/// @description Insert description here
// You can write your code in this editor

image_speed = random_range(0.2,0.8);
hsp = 0;
vsp = random_range(-1,-3.5);
spd = random_range(0,-2);
dir = 0;

alarm[0] = 15;

dustDecay = 0.2;

if (instance_exists(oNewt)) depth = oNewt.depth-10;