/// @description Insert description here
// You can write your code in this editor

if gamepad_is_connected(4)
{
	window_set_cursor(cr_none);
	cursor_sprite = noone;
}
else
{
	window_set_cursor(cr_none);
	cursor_sprite = sCrosshair1;
}

global.hitsound = snNThitSound;

global.kills = 0;
global.killsthisroom = 0;
global.hasweapon = false;
global.impulse101 = false;
global.autoRun = true;
global.roomscleared = 0;

global.critTotalDMG = 0;
global.hasCrit = 1;
critChanceBase = 2;
critChance = 0;
critProc = 5*60;
critProcReset = critProc;
global.critTimer = 0;

global.inputdevice = input_profile_get();

global.newtCenter = 0;

global.hitStopOn = true;

killtextscale = 1;

killscombo = 0;
combotimer = 0;
comboreset = 300;
comboRedness = 0;
combomax = 0;

firstCombo = true;
firstComboEnded = false;

//sodas
global.soda[0] = false; //double jump
global.soda[1] = false; //homing 
global.soda[2] = false; //blood chalice
global.soda[3] = false; //two health ups

global.sodasLeft = ds_list_create();

global.lvlFloor = 1;