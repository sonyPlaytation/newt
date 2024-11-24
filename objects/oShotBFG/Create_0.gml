/// @description Insert description here
// You can write your code in this editor

//crit outline and trail
outline_init();
length = 25;
width = sprite_height;
sprite = -1;
slim = 1;
color = c_lime;
alpha = 0.5;

dir = 0; 
spd = 0;
xspd = 0;
yspd = 0;

firstDMG = (oWeapon.damage * irandom_range(2,10));

ballHealth = firstDMG;

done = false;

tracerSpread = 24;
tracerNumber = 40;
tracerAngle = oWeapon.image_angle;
accuracy = 2
damage = 20*oInv.dmgMod;;