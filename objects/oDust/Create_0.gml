/// @description Insert description here
// You can write your code in this editor

image_speed = random_range(0.4,1);
image_index = random_range(0,2);

spd = 2
dir = random(360)
hsp = random_range(-4,4);
vsp = random_range(-1,1);
size = 1;
sizeChosen = false;

image_angle = irandom(359);

dustDecay = 0.2;

if (instance_exists(oNewt)) depth = oNewt.depth-10;

grow = 0;