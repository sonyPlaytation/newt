/// @function					set_song_ingame()
/// @description				Changes the song you want to play next, with fade in and out times.
/// @param {Real}	song		The song you want to play.
/// @param {Real}	fadeOut		The time it should take to fade out, counted in frames.
/// @param {Real}	fadeIn		The time it should take to fade in, counted in frames.
/// @param {String}	message		"Now Playing" Message.
/// @param {Real}	messageFade Message fade fime, counted in frames.
/// @returns					N/A
function set_song_ingame(_song, _fadeOut = 0, _fadeIn = 0, _msg = "", _msgFade = 60)
{
		//_song to set any song (including noone to stop
		//_fadeOut to fade out in frames
		//_fadeIn to fade in in frames
	global.songPlaying = _song
	with (oMusicManager)
	{
		targetSongAsset = _song;	
		fadeOutTime = _fadeOut;
		fadeInTime = _fadeIn;
		playingMsg = _msg;
		playingFade = _msgFade; 
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
//NOTE: PLEASE REWORK THIS SYSTEM
floorBGM[0] = mTutorial;
floorBGM[1] = mStage1;
floorBGM[2] = mPhysical;
floorBGM[444] = mTutorial;

//Now Playing Messages
playingMsg = "TESTEST"
alpha = 0;

fadeTarg = 0;
playingFade = 0;
holdTime = 360;
fadeDone = false;

msgX = RESOLUTION_W/2;
msgY = RESOLUTION_H;