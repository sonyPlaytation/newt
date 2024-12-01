/// @description Insert description here
// You can write your code in this editor

event_inherited();

if instance_exists(oDummy){oDummy.melonTimer = 60};

repeat(35)
{
	with instance_create_layer(x,bbox_bottom-(sprite_height/2), "Player", oBlood)
	{
		oSFX.goremain = true;
		depth -= 15;
	}
}
