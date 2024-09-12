/// @description Insert description here
// You can write your code in this editor

if (done == 0)
{
	vsp = vsp + grv;
	image_angle -= abs(vsp+12);

	//horizontal collision
	if (place_meeting(x+hsp,y,oCollide))
	{
		while (!place_meeting(x+sign(hsp),y,oCollide))
		{
			x += sign(hsp)
		}
		hsp = -hsp/2;
		audio_play_sound(sound[image_index], 300, false, 1, 0, random_range(0.9, 1.2));
		
	}
	x += hsp;

	//vertical collision
	if (place_meeting(x,y+vsp,oCollide))
	{
		if (vsp > 0) 
		{
			image_angle = 0;
			done = 1;
			alarm[0] = 60;
		}
		while (!place_meeting(x,y+sign(vsp),oCollide))
		{
			y += sign(vsp)
		}
		
		vsp = 0;
		
		audio_play_sound(sound[image_index], 300, false, 1, 0, random_range(0.9, 1.2));
	}
	y += vsp;
}

