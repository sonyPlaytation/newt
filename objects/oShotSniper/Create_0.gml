/// @description Insert description here
// You can write your code in this editor

//outline_init();
//width = 4;
//slim = 0;
//color = c_red

draw_alpha = 1;
check = true;
prev_x = x;
prev_y = y;
can_damage = true;
hitSprite = noone;
shotNumber = 0;
visDist = 0;
headshot = false;

if hitSprite = sHitFLCL{flashScale = 500}else flashScale = 2;

baseDMG = oMultiWeapon.damage
dist = 0;

crit = false;
if crit {col = c_red}else col = c_white;

layer = layer_get_id("shots");