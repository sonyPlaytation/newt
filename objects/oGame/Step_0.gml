/// @description Insert description here
// You can write your code in this editor


if combotimer > comboreset {combotimer = comboreset};

if (window_has_focus()) {
    display_mouse_lock(window_get_x(), window_get_y(), window_get_width(), window_get_height());
} else display_mouse_unlock();

var rng = irandom(100);
critChance = min((global.critTotalDMG * 0.015), 10)+ critChanceBase

if critProc = 0
{
	if rng <= critChance
	{
			global.hasCrit = 1;
	}
	
	global.critTotalDMG = 0;
	critProc = critProcReset;
}
critProc--;		

if global.critTimer != 0
{
	global.critTimer--;
	oMultiWeapon.crit = true;
}

