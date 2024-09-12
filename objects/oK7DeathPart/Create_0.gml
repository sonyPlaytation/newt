/// @description Insert description here
// You can write your code in this editor

image_speed = random_range(0.4,1);
image_index = random_range(0,2);

spd = irandom_range(45,65);
decel = choose(2,3);

dir = random(360)
hsp = random_range(-4,4);
vsp = random_range(-4,4);
image_xscale = choose(1,-1);
image_yscale = choose(1,-1);

dustDecay = 0.2;

if (instance_exists(oNewt)) depth = oNewt.depth-10;

alarm[0] = 60;

done = false;