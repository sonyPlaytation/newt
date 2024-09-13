/// @description Insert description here
// You can write your code in this editor

//item shop theme
if room == rTest1
{
	var shopTheme = choose(
	mAddiction,
	mShop2);
	set_song_ingame(shopTheme,15);
}

if room == rTest3
or room == rTutorialNew1
{
	set_song_ingame(floorBGM[global.lvlFloor],15);
}
