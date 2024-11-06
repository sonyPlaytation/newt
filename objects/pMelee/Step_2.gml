/// @description Insert description here
// You can write your code in this editor


if hit == true and click = 0
{
	var _sound = audio_play_sound(oMultiWeapon.hitSound,800,false);
	audio_sound_gain(_sound,global.sfxVolume,0);
	hit = false;
}


