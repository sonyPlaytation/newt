/// @description Insert description here
// You can write your code in this editor

//item shop theme

if room == rTest1
or room == rSoda2
{
	var shopTheme = (mAddiction)
	set_song_ingame(shopTheme,15,,"Noiseless - Addiction",1);
}

if room == rTest3
or room == rTutorialNew1
or room == rTestDemo1
or room == rCombatTest
or global.lvlFloor = 444
{
	set_song_ingame(floorBGM[global.lvlFloor],15);
}

if room == rDemoEndScreen
{
	set_song_ingame(snCOPYRIGHTINFRINGEMENT);
}

