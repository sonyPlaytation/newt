/// @description Insert description here
// You can write your code in this editor

vsp = vsp + grv;
headY = y-16;

//vertical collision
if (place_meeting(x,y+vsp,oCollide)) or (place_meeting(x,y+vsp,oCollSemi))
{
	while (!place_meeting(x,y+sign(vsp),oCollide)) and (place_meeting(x,y+vsp,oCollSemi))
	{
		y += sign(vsp)
	}
	vsp = 0;
}

y += vsp;




