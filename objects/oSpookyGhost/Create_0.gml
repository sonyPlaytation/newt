/// @description Insert description here
// You can write your code in this editor


image_angle = irandom_range(60,130);
spd = random_range(8,12);
dir = image_angle;
image_xscale = max(1,spd/sprite_width);
image_xscale = random_range(0.5,1.5);

homingtarget = noone;
turnRadius = 1;