/// @description Insert description here
// You can write your code in this editor

var _finalVol = global.musicVolume*global.masterVolume;

//play target song
if songAsset != targetSongAsset
{
	
	//tell the old song to fade out
	if audio_is_playing(songInstance)
	{
		//add songinstance to our array of songs to fade out
		array_push(fadeOutInst, songInstance)
		//add the songinstances starting volume (so theres no abrupt change in vol;ume
		array_push(fadeOutInstVol,fadeInInstVol );
		//add the fadeoutinsts fade out frames
		array_push(fadeOutInstTime, fadeOutTime);
		
		//reset the song inst and song asset vars
		songInstance = noone;
		songAsset = noone;
		
	}
	
	
	//play the song if the old song is gone
	if array_length (fadeOutInst) == 0
	{
		if audio_exists(targetSongAsset)
		{
			//play the song and store its instance in a variable
			songInstance = audio_play_sound(targetSongAsset, 400, true);

			//start the songs voluem at 0
			audio_sound_gain(songInstance, 0, 0)
			fadeInInstVol = 0;
		}
	
		//set the song asset top match target song asset
		songAsset = targetSongAsset;
		}
}



//volume control
//main song volume
if audio_is_playing(songInstance)
{
	//fade the song in
	if fadeInTime >0
	{
		if fadeInInstVol < 1 {fadeInInstVol += 1/fadeInTime} else fadeInInstVol = 1;
	}
	//immediately start the song if the fade in time is 0 frames
	else
	{
		fadeInInstVol = 1;
	}
	
	//actually set gain
	audio_sound_gain(songInstance, fadeInInstVol*_finalVol, 0);
	
}

//fading songs out
	
for (var i = 0; i < array_length(fadeOutInst); i++)
{
	//fade the volume
	if fadeOutInstTime[i] > 0
	{
		if fadeOutInstVol[i] > 0 {fadeOutInstVol[i] -= 1/fadeOutInstTime[i]};
	}
	else //immediately cut volume to 0
	{
		fadeOutInstVol[i] = 0;
	}
		
	//set gain
	audio_sound_gain(fadeOutInst[i], fadeOutInstVol[i]*_finalVol,0);
		
	//stop song when at 0
	if fadeOutInstVol[i] <= 0
	{
		if audio_is_playing(fadeOutInst[i]){audio_stop_sound(fadeOutInst[i])};	
		//remove it from arrays
		array_delete(fadeOutInst,i,1);
		array_delete(fadeOutInstVol,i,1);
		array_delete(fadeOutInstTime,i,1);
		//set loop back to one
		i--;
	}
}


	
	

