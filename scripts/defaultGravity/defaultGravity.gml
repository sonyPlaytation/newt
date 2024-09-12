// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function defaultGravity(){

with(self){
vsp += grv;
//horizontal collision
if (place_meeting(x+hsp,y,oCollide))
{
	while (!place_meeting(x+sign(hsp),y,oCollide))
	{
		x += sign(hsp);
	}
	hsp = 0;
	
}
x += hsp;

//vertical collision
if (place_meeting(x,y+vsp,oCollide))
{
	while (!place_meeting(x,y+sign(vsp),oCollide))
	{
		y += sign(vsp);
	}
	vsp = 0;

}
y += vsp;
}


}