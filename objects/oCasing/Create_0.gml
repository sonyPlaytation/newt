/// @description Insert description here
// You can write your code in this editor

done = 0;
hsp = 0;
vsp = 0;
grv = 0.3;

image_angle = irandom(359);

//alarm[0] = 120

if (instance_exists(oNewt)) depth = oNewt.depth-50;

//drop sounds
sound[0] = noone;
sound[1] = snCasingPistol;
sound[2] = snCasingShotgun;
sound[3] = Shell_Casing_1;