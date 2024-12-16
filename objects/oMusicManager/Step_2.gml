/// @description

var _currPitch = audio_sound_get_pitch(songInstance);

if instance_exists(oNewt)
{
	audio_sound_pitch(songInstance,min(_currPitch + 0.005, 1));
}
else if instance_exists(oDead)
{
	audio_sound_pitch(songInstance,max(_currPitch - 0.005, 0.65));	
}