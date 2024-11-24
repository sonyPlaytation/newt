/// @description Insert description here
// You can write your code in this editor

event_inherited();

width = 4;
slim = 1;
color = c_white;

done = 0;
hsp = 0;
vsp = 0;
grv = 0.3;

bounces = 5;

image_angle = irandom(359);

alarm[0] = 500

if (instance_exists(oNewt)) depth = oNewt.depth-50;

//drop sounds
sound[5] = snSoda5;
sound[4] = snSoda4;
sound[3] = snSoda3;
sound[2] = snSoda2;
sound[1] = snSoda1;

wallTouched = false;

rotspeed = random_range(8,24);
