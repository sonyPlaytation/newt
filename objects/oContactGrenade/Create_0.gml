
//crit outline and trail
outline_init();
length = 8;
width = bbox_bottom-bbox_top;
sprite = -1;
slim = 1;
color = c_white;
alpha = 0.5;

dir = 0; 
spd = 9;
hsp = 0;
vsp = 0;

homingtarget = instance_nearest(mouse_x,mouse_y,pEnemy);

baseDMG = oMultiWeapon.damage
dist = 0;

image_xscale = 2;
image_yscale = 2;

flash = 3;
grv = 0.3;		//gravity
timer = 5;
alarm[0] = 15;
