/// @description Insert description here
// You can write your code in this editor

		
var imgRot = 1;
rot -= imgRot*image_yscale;
			
vsp = vsp + grv;

//horizontal collision
if (place_meeting(x+hsp,y,oCollide))
{
	while (!place_meeting(x+sign(hsp),y,oCollide))
	{
		x += sign(hsp)
	}
	hsp = -hsp/2;
}
x += hsp;

//vertical collision
if (place_meeting(x,y+vsp,oCollide))
{
	if (vsp > 0) 
	{
		hsp *= 0.85;
		image_index = 1;
		rot = round_Ext(rot,180);
	}
	while (!place_meeting(x,y+sign(vsp),oCollide))
	{
		y += sign(vsp)
	}
	vsp = 0;
}
y += vsp;




