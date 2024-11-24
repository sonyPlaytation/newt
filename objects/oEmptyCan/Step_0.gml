/// @description Insert description here
// You can write your code in this editor

event_inherited();


if collision_circle(x,y,phy_speed *1.75 ,oCollide,0,0)
{
	if !wallTouched //and phy_speed > 0.5
	{
		wallTouched = true;
		var _snd = irandom_range(2,5);
		audio_play_sound(sound[_snd], 300, false);
	}
}
else wallTouched = false;

//if (done == 0)
//{
//	vsp = vsp + grv;
	

//	//image_angle +=abs(vsp)*rotspeed;

//	//horizontal collision
//	if (place_meeting(x+hsp,y,oCollide))
//	{
//		while (!place_meeting(x+sign(hsp),y,oCollide))
//		{
//			x += sign(hsp)
//		}
//		hsp = -hsp/2
//	}
//	x += hsp;

//	//vertical collision
//	if (place_meeting(x,y+vsp,oCollide))
//	{

//		while (!place_meeting(x,y+sign(vsp),oCollide))
//		{
//			y += sign(vsp)
//		}
		
//		if bounces>0 
//		{
//			//vsp = -vsp/2;
			 
//			//rotspeed = random_range(8,24);
//			//bounces--
//		} else if bounces <= 0 
//		{
//			//vsp = 0; 
//			//image_angle = lerp(image_angle,90,0.01);  
//			done = 1;
//		}
//	}
//	y += vsp;
//}


