/// @description Insert description here
// You can write your code in this editor

if (done == 0)
{
	vsp = vsp + grv;
	

	image_angle +=abs(vsp)*rotspeed;

	//horizontal collision
	if (place_meeting(x+hsp,y,oCollide))
	{
		while (!place_meeting(x+sign(hsp),y,oCollide))
		{
			x += sign(hsp)
		}
		hsp = -hsp/2;
		audio_play_sound(sound[5], 300, false, 1, 0, random_range(0.9, 1.2));
		
	}
	x += hsp;

	//vertical collision
	if (place_meeting(x,y+vsp,oCollide))
	{

		while (!place_meeting(x,y+sign(vsp),oCollide))
		{
			y += sign(vsp)
		}
		
		if bounces>0 
		{
			vsp = -vsp/2;
			audio_play_sound(sound[bounces], 300, false, 1, 0, random_range(0.9, 1.2)); 
			rotspeed = random_range(8,24);
			bounces--
		} else if bounces <= 0 
		{
			vsp = 0; 
			image_angle = lerp(image_angle,90,0.01);  
			done = 1;
		}
	}
	y += vsp;
}

