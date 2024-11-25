/// @description By Argument

var _sfxVol = global.sfxVolume;

if physDestroyed != noone //physics object destroyed
{
	var _sound = audio_play_sound(physDestroyed,400,false);
	audio_sound_gain(_sound,_sfxVol,0);
	physDestroyed = noone;
}

if explode != noone and expTime == 0 //physics object destroyed
{
	var _sound = audio_play_sound(explode,400,false);
	audio_sound_gain(_sound,_sfxVol,0);
	explode = noone;
}else if expTime > 0 {expTime--};