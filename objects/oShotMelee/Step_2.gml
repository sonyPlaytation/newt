/// @description Insert description here
// You can write your code in this editor

if place_meeting(x,y,pEntity)
{
	hit = true
	oWeapon.combo = 1;
};

if hit == true and click = 0
{
	var _sound = audio_play_sound(oWeapon.hitSound,800,false);
	audio_sound_gain(_sound,global.sfxVolume,0);
	hit = false;
}