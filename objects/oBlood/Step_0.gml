/// @description Insert description here
// You can write your code in this editor

	
	
	vsp = vsp + grv;
	
	instance_create_depth(x,y,depth,oBloodSmall)
	
	image_angle +=30;

	//horizontal collision
	if (place_meeting(x+hsp,y,oCollide)){instance_destroy();}else {x += hsp;}

	//vertical collision
	if (place_meeting(x,y+vsp,oCollide)){instance_destroy();}else {y += vsp;}


if place_meeting(x,y,oNewt)
{
	if global.soda[2] = true and !fakeBlood
	{
		oNewt.bloodMeter += irandom(3);
		oNewt.blood = 3;
		instance_destroy();
		audio_sound_pitch(t1,random_range(0.25,0.7));
		oSFX.bloodDrip = true;
	}	
}