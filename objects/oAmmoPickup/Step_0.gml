/// @description Insert description here
// You can write your code in this editor
var done = false;
vsp += grv;

//vertical collision
if !done and (place_meeting(x,y+vsp,oCollide)) or (place_meeting(x,y+vsp,oCollSemi))
{
	while (!place_meeting(x,y+sign(vsp),oCollide)) and (!place_meeting(x,y+vsp,oCollSemi))
	{
		y += sign(vsp)
	}
	vsp = 0;
	done = true;
}
y += vsp;

if (place_meeting(x,y+vsp,oNewt))
{		
	getAmmo();
	oGame.combotimer += 60;
	oSFX.soundgetammo = true;
	instance_destroy();
}