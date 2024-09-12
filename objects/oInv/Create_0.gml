/// @description Insert description here
// You can write your code in this editor

//health
hpMax = 3;
hp = 3;

//ammo
pistAmmo = 255;
grenAmmo = 0;
grenAmmoString = string(grenAmmo);

primary = noone;
secondary = noone;
current = primary;

souls = 0;
sodas = 5;
levelCurrent = 1;
levelNext = 100;

//level costs
lvl[0] = 15;

//ammo index
enum AMMO
{
	UNARMED = -1,
	LIGHT = 255, //weak pistols, smgs
	MEDIUM = 100, //shotguns, strong semi-auto pistols
	HEAVY = 50, //revolvers, rifles
	EXPLOSIVE = 50, //rocket launchers n shit
	GRENADE = 16,
	MAGIC = 160
	
	
	
}