/// @description Insert description here
// You can write your code in this editor

event_inherited();

instance_create_depth(x,y,depth,oBloodSmall);

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