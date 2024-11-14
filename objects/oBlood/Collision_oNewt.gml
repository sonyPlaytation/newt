/// @description Insert description here
// You can write your code in this editor

if global.soda[2] = true and !fakeBlood
{
	oNewt.bloodMeter += irandom(3);
	oNewt.blood = 3;
	instance_destroy();
	audio_sound_pitch(t1,random_range(0.25,0.7));
	oSFX.bloodDrip = true;
}
