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
shotNumber = 0;
visDist = 0;

hitSprite = noone;
flashScale = 2;

baseDMG = oWeapon.damage*oInv.dmgMod;
dist = 0;

crit = false;
if crit {col = c_red}else col = c_white;

layer = layer_get_id("shots");