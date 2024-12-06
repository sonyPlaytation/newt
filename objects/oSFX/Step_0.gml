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


//chainsaw sound
if chainsawLoop != noone 
{
	if chainsawLoop == 1 and !audio_is_playing(chainsawLoopInst)
	{
		audio_stop_sound(chainsawIdleInst);
		audio_sound_loop_start(snChainsawLoop,0.28);
		audio_sound_loop_end(snChainsawLoop,1.56);
		chainsawLoopInst = audio_play_sound(snChainsawLoop, 800, true);
		chainsawend = true;
	}
	else if chainsawLoop == 0 and !audio_is_playing(chainsawIdleInst)
	{
		audio_stop_sound(chainsawLoopInst);
		audio_sound_loop_start(snChainsawIdle,0.28);
		audio_sound_loop_end(snChainsawIdle,1.56);
		chainsawIdleInst = audio_play_sound(snChainsawIdle, 800, true);
	}
}

//turn sound off
if chainsawend == true and !audio_is_playing(chainsawIdleInst)
{
	var _sound = audio_play_sound(snChainsawEnd,800,false);
	audio_sound_gain(_sound,_sfxVol,0);
	chainsawend = false;
}

chainsawLoop = noone;