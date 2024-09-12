/// @description Insert description here
// You can write your code in this editor

vsp += grv;

//vertical collision
if (place_meeting(x,y+vsp,oCollide))
{
	while (!place_meeting(x,y+sign(vsp),oCollide))
	{
		y += sign(vsp)
	}
	vsp = 0;
}

y += vsp;

if (place_meeting(x,y+vsp,oNewt))
{
	if (!instance_exists(oAmmoCount))
	{
		instance_create_layer(x,y,"Weapon",oAmmoCount);	
	}
		
	oInv.grenAmmo++;
	audio_play_sound(snHL1Pickup,999,false)
	instance_destroy();
}