/// @description Insert description here
// You can write your code in this editor
var done = false;
vsp += grv;

//vertical collision
if !done and (place_meeting(x,y+vsp,oCollide))
{
	while (!place_meeting(x,y+sign(vsp),oCollide))
	{
		y += sign(vsp)
	}
	vsp = 0;
	done = true;
}

y += vsp;

if (place_meeting(x,y+vsp,oNewt))
{
	
	if (!instance_exists(oAmmoCount))
	{
		instance_create_layer(x,y,"Weapon",oAmmoCount);	
	}
		
	getAmmo();
	oGame.combotimer += 60;
	oSFX.soundgetammo = true;
	instance_destroy();
}