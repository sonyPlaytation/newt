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

#macro RESOLUTION_W 1920
#macro RESOLUTION_H 1080
display_set_gui_size(RESOLUTION_W,RESOLUTION_H);

global.gameState = 0;

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
global.flashDone = false;

killtextscale = 1;

killscombo = 0;
combotimer = 0;
comboreset = 300;
comboRedness = 0;
combomax = 0;

firstCombo = true;
firstComboEnded = false;

global.fDoom = font_add_sprite_ext(sFontDoom, " 0123456789abcdefghijklmnopqrstuvwxyz,.:;|[]=+<>'#$%()*/^&@_{?!-",true,0);
global.fIgnoreMod = font_add_sprite_ext(sFontIgnoreMOD," ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.,;:?!`'+-=*%_()[]{}~#&@^|/\<>",true,0);

msgScale = 3;
systemAlpha = 1;
sysMsg = "";

//sodas
global.soda[0] = false; //double jump
global.soda[1] = false; //homing 
global.soda[2] = false; //blood chalice
global.soda[3] = false; //three health ups
global.soda[4] = false; //ammo max up random
global.soda[5] = false; //air dashes
global.soda[6] = false; //damage up


desc[0] = "Extra Jump\n(stacks)";
desc[1] = "Homing Shots";
desc[2] = "Blood Heals";
desc[3] = "+2 Max HP\n(stacks)";
desc[4] = "Randokm Max\nAmmo Increase\n(stacks)";
desc[5] = "Air Dashes";
desc[6] = "DMG UP";

global.sodasLeft = ds_list_create();
global.lvlFloor = 1;

//CHEATS
	// Invincibility
	#region
	code1Index = 0;
	code1Seq = ds_list_create();
	
	ds_list_add(code1Seq,ord("I"));
	ds_list_add(code1Seq,ord("D"));
	ds_list_add(code1Seq,ord("D"));
	ds_list_add(code1Seq,ord("Q"));
	ds_list_add(code1Seq,ord("D"));
	#endregion
	
	// Full health and Ammo and sodas
	#region
	code2Index = 0;
	code2Seq = ds_list_create();
	
	ds_list_add(code2Seq,ord("I"));
	ds_list_add(code2Seq,ord("D"));
	ds_list_add(code2Seq,ord("K"));
	ds_list_add(code2Seq,ord("F"));
	ds_list_add(code2Seq,ord("A"));
	#endregion
	
	// get soda
	#region
	code3Index = 0;
	code3Seq = ds_list_create();
	
	ds_list_add(code3Seq,ord("I"));
	ds_list_add(code3Seq,ord("D"));
	ds_list_add(code3Seq,ord("S"));
	ds_list_add(code3Seq,ord("O"));
	ds_list_add(code3Seq,ord("D"));
	ds_list_add(code3Seq,ord("A"));
	#endregion
	