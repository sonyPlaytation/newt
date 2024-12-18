/// @description Insert description here
// You can write your code in this editor

if place_meeting(x,y,pEnemy)
{
	hit = true
	if (oWeapon.combos) {oWeapon.combo = 1};
}
else oWeapon.combo = 0;

if hit == true and click = 0
{
	var _sound = audio_play_sound(oWeapon.hitSound,800,false);
	audio_sound_gain(_sound,global.sfxVolume,0);
	hit = false;
}