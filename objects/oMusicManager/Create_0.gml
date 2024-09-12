
function set_song_ingame(_song, _fadeOut = 0, _fadeIn = 0)
{
		//_song to set any song (including noone to stop
		//_fadeOut to fade out in frames
		//_fadeIn to fade in in frames
	with (oMusicManager)
	{
		targetSongAsset = _song;	
		fadeOutTime = _fadeOut;
		fadeInTime = _fadeIn;
	}
}

global.masterVolume = 1;
global.musicVolume = 6;

//info for song we want to play
songInstance = noone;
songAsset = noone;
targetSongAsset = noone;
fadeOutTime = 0; //frames to fade song out for
fadeInTime = 0; //frames to fade in new song
fadeInInstVol = 1; //voluem of song instance


//for fading music out and stopping songs that are no longer playing

fadeOutInst = array_create(0); //the audio instances to fade out
fadeOutInstVol = array_create(0); //the volume of each audio instance
fadeOutInstTime = array_create(0); //speed of fadeout

//floor themes
floorBGM[0] = mTutorial;
floorBGM[1] = mStage1;
floorBGM[2] = mPhysical;
