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


if hit != noone //hitsound
{
	if hit > 0 {var _hit = snHitArmor}
	else
	{
		var _hit = choose(snHit1, snHit2, snHit3)
	}
	
	audio_sound_pitch(_hit,random_range(0.8,1.2));
		var _sound = audio_play_sound(_hit,800,false);
		audio_sound_gain(_sound,_sfxVol,0);
	
	var squish = choose(snSquish4, snSquish5, snSquish11, snSquish13 )
	
	audio_sound_pitch(squish,random_range(0.8,1.2));
	_sound = audio_play_sound(squish,800,false);
	audio_sound_gain(_sound,_sfxVol,0);
	
	hit = noone;
}