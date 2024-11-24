/// @description Insert description here
// You can write your code in this editor

event_inherited();

if (oInv.hp <= 0)
{
	playerDie();	
}

jumpMax = 1 + oInv.extraJumps;
