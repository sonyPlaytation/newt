/// @description By Boolean

if instance_exists(oShotNTTE){laserSoundLoop = true} else laserSoundLoop = false;

var _sfxVol = global.sfxVolume;

//get ammo
if soundgetammo == true
{
	var _sound = audio_play_sound(snHL1Pickup,800,false);
	audio_sound_gain(_sound,_sfxVol,0);
	soundgetammo = false;
}

//get ammo
if bloodDrip == true
{
	var _sound = audio_play_sound(t1,450,false,2);
	audio_sound_gain(_sound,_sfxVol,0);
	bloodDrip = false;
}


//get ammo
if collat == true
{
	var _sound = audio_play_sound(snCollateral,800,false);
	audio_sound_gain(_sound,_sfxVol,0);
	collat = false;
}

//get soul
if soulget == true
{
	audio_sound_pitch(snSoulGather,random_range(1,1.5));
	var _sound = audio_play_sound(snSoulGather,800,false);
	audio_sound_gain(_sound,_sfxVol,0);
	soulget = false;
}

//ultrakill coin ricochet sound
if ricoshot == true
{
	audio_sound_pitch(snCoinClean,1.1);
	var _sound = audio_play_sound(snCoinClean,800,false);
	audio_sound_gain(_sound,_sfxVol,0);
	
	audio_sound_pitch(snRicochet,0.65);
	var _sound = audio_play_sound(snRicochet,800,false);
	audio_sound_gain(_sound,_sfxVol,0);
	
	ricoshot = false;
}

//killer 7 death layers
if k7death == true
{
	var _sound = audio_play_sound(choose(snK7Laff1,snK7Laff2,snK7Laff3),800,false);
	audio_sound_gain(_sound,_sfxVol,0);
	
	var _sound = audio_play_sound(snK7Death,800,false);
	audio_sound_gain(_sound,_sfxVol,0);
	
	k7death = false;
}

//mouth popping random pitches
if mouthpop == true
{
	audio_sound_pitch(snPop1,random_range(0.8,1.2));
	audio_sound_pitch(snPop2,random_range(0.8,1.2));
	audio_sound_pitch(snPop3,random_range(0.8,1.2));
	audio_sound_pitch(snPop4,random_range(0.8,1.2));
	audio_sound_pitch(snPop5,random_range(0.8,1.2));
	
	var _sound = audio_play_sound(choose(snPop1,snPop2,snPop3,snPop4,snPop5),800,false);
	audio_sound_gain(_sound,_sfxVol,0);
	
	mouthpop = false;
}


//killer 7 pain rand
if k7hurt == true
{
	var _sound = audio_play_sound(choose(snK7Hurt1,snK7Hurt2),800,false);
	audio_sound_gain(_sound,_sfxVol,0);	
	k7hurt = false;
}

//get soda
if sodaget == true
{
	var _sound = audio_play_sound(snSodaGet,800,false);
	audio_sound_gain(_sound,_sfxVol,0);
	sodaget = false;
}

//get heal
if healsound == true
{
	var _sound = audio_play_sound(snHL1Heal,800,false);
	audio_sound_gain(_sound,_sfxVol,0);
	healsound = false;
}

//get ball
if ballgrab == true
{
	var _sound = audio_play_sound(snGetBall,800,false);
	audio_sound_gain(_sound,_sfxVol,0);
	ballgrab = false;
}

//melee guitar
if meleeGuitar == true
{
	var _sound = audio_play_sound(snMeleeGitar,800,false);
	audio_sound_gain(_sound,_sfxVol,0);
	meleeGuitar = false;
}

//sandman hit
if sandmanhit == true
{
	var _sound = audio_play_sound(snBatHit,800,false);
	audio_sound_gain(_sound,_sfxVol,0);
	sandmanhit = false;
}

//sandman hit
if baseballcrack == true
{
	var _sound = audio_play_sound(snBaseballHit,800,false);
	audio_sound_gain(_sound,_sfxVol,0);
	baseballcrack = false;
}

//newt jumpin
if newtjump == true
{
	audio_sound_pitch(snSquish8,random_range(0.8,1.2));
	var _sound = audio_play_sound(snSquish8,500,false);
	audio_sound_gain(_sound,_sfxVol,0);
	newtjump = false;
}

//crit shot
if critshot == true
{
	audio_sound_pitch(snCritShot,random_range(0.8,1.2));
	var _sound = audio_play_sound(snCritShot,500,false);
	audio_sound_gain(_sound,_sfxVol,0);
	critshot = false;
}


	//crit hit sound
if crithit == true
{
	var _sound = audio_play_sound(choose(snCrit1,snCrit2,snCrit3,snCrit4,snCrit5),500,false);
	audio_sound_pitch(snCrit1,random_range(0.8,1.2));
	audio_sound_pitch(snCrit2,random_range(0.8,1.2));
	audio_sound_pitch(snCrit3,random_range(0.8,1.2));
	audio_sound_pitch(snCrit4,random_range(0.8,1.2));
	audio_sound_pitch(snCrit5,random_range(0.8,1.2));
	audio_sound_gain(_sound,_sfxVol,0);
	crithit = false;
}

	//parry sound
if parry == true
{
	var _sound = audio_play_sound(choose(snParry1,snParry2,snParry3),500,false);
	audio_sound_pitch(snParry1,random_range(0.9,1.1));
	audio_sound_pitch(snParry2,random_range(0.8,1.2));
	audio_sound_pitch(snParry3,random_range(0.7,1.3));
	audio_sound_gain(_sound,_sfxVol,0);
	parry = false;
}

//woosh basic
if wooshBasic == true
{
	var _sound = audio_play_sound(choose(snWoosh1,snWoosh2,snWoosh3),500,false);
	audio_sound_pitch(snWoosh1,random_range(0.8,1.2));
	audio_sound_pitch(snWoosh2,random_range(0.8,1.2));
	audio_sound_pitch(snWoosh3,random_range(0.8,1.2));
	audio_sound_gain(_sound,_sfxVol,0);
	wooshBasic = false;
}

//gore physics sound
if goremain == true
{
	var _sound = audio_play_sound(choose(snGore1,snGore2,snGore3,snGore4),500,false);
	audio_sound_pitch(snGore1,random_range(0.8,1.2));
	audio_sound_pitch(snGore2,random_range(0.8,1.2));
	audio_sound_pitch(snGore3,random_range(0.8,1.2));
	audio_sound_pitch(snGore4,random_range(0.8,1.2));
	audio_sound_gain(_sound,_sfxVol,0);
	goremain = false;
}

//walk splat
if walksplat == true
{
	var _sound = audio_play_sound(choose(snWalk1,snWalk2),500,false);
	audio_sound_pitch(snWalk1,random_range(0.8,1.2));
	audio_sound_pitch(snWalk2,random_range(0.8,1.2));
	audio_sound_gain(_sound,_sfxVol,0);
	walksplat = false;
}

//mario hit his head YEOWCH
if mariobump == true
{
	var _sound = audio_play_sound(snBump,800,false);
	audio_sound_gain(_sound,_sfxVol,0);
	mariobump = false;
}

//crocodile shotgun
if enemyShot != false
{
	var _sound = audio_play_sound(enemyShot,800,false);
	audio_sound_gain(_sound,_sfxVol,0);
	enemyShot = false;
}


//rocket launch
if rocketlaunch == true
{
	var _sound = audio_play_sound(snShotRocket,800,false);
	audio_sound_gain(_sound,_sfxVol,0);
	rocketlaunch = false;
}

//MGS !
if whatwasthatnoise = true
{
	var _sound = audio_play_sound(snAlertMGS,800,false);
	audio_sound_gain(_sound,_sfxVol,0);
	whatwasthatnoise = false;
}

//break bricks
if brickbreak == true
{
	var _sound = audio_play_sound(snBrickBreak,800,false);
	audio_sound_gain(_sound,_sfxVol,0);
	brickbreak = false;
}

//break bricks
if grindland == true
{
	var _sound = audio_play_sound(snGrLand,800,false);
	audio_sound_gain(_sound,_sfxVol,0);
	grindland = false;
}

//weapon switch
if weaponswitchsound == true
{
	var _sound = audio_play_sound(snSwitchWeapon, 300, false);
	audio_sound_gain(_sound,_sfxVol,0);
	weaponswitchsound = false;
}

//half life scientist scream

if scientistscream == true
{
		var science
		science = irandom(4)

		switch (science)
		{
			case 0:
			var _sound = audio_play_sound(snPain1,100,false);
			audio_sound_gain(_sound,_sfxVol,0);
			scientistscream = false;
			break;
	
			case 1:
			var _sound = audio_play_sound(snPain2,100,false);
			audio_sound_gain(_sound,_sfxVol,0);
			scientistscream = false;
			break;
	
			case 2:
			var _sound = audio_play_sound(snPain3,100,false);
			audio_sound_gain(_sound,_sfxVol,0);
			scientistscream = false;
			break;
	
			case 3:
			var _sound = audio_play_sound(snPain4,100,false);
			audio_sound_gain(_sound,_sfxVol,0);
			scientistscream = false;
			break;
	
			case 4:
			var _sound = audio_play_sound(snPain5,100,false);
			audio_sound_gain(_sound,_sfxVol,0);
			scientistscream = false;
			break;
		}
}

// exit door
if enterleveldoor == true
{
		var godoor

		godoor = irandom(1)

		switch (godoor)
		{
			case 0:
			var _sound = audio_play_sound(snDoor1,999,false)
			audio_sound_gain(_sound,_sfxVol,0);
			enterleveldoor = false;
			break;
	
			case 1:
			var _sound = audio_play_sound(snDoor2,999,false)
			audio_sound_gain(_sound,_sfxVol,0);
			enterleveldoor = false;
			break;
	
		}
}


//newt take damage
if gethurt == true
{
	audio_sound_pitch(snNewtHurt,choose(0.9,1,1.2));
	var _sound = audio_play_sound(snNewtHurt,800,false);
	audio_sound_gain(_sound,_sfxVol,0);
	gethurt = false;
}

//new weapon
if newweapon == true
{
	var _sound = audio_play_sound(oWeapon.pickupsound, 600, false,1,0,random_range(0.9,1.1))
	audio_sound_gain(_sound,_sfxVol,0);
	newweapon = false;
}

//rattle door handle
if doorstuck == true
{
	var _sound = audio_play_sound(snHL1DoorLock,999,false);
	audio_sound_gain(_sound,_sfxVol,0);
	doorstuck = false;
}

//stompy enemy
if koopastomp == true
{
	var _sound = audio_play_sound(snStomp,300,false);
	audio_sound_gain(_sound,_sfxVol,0);
	koopastomp = false;
}



//weapon switch
if potterybreak == true
{
	audio_sound_pitch(snVaseBreak,choose(0.9,1,1.2))
	var _sound = audio_play_sound(snVaseBreak,500,0);
	audio_sound_gain(_sound,_sfxVol,0);
	potterybreak = false;
}


//looping sounds
	
	//NTTE Laser
	//turn sound on and store instance of sound
	if laserSoundLoop == true and !audio_is_playing(laserSoundLoopInst)
	{
		audio_sound_loop_start(snShotLaserAll,0.75);
		audio_sound_loop_end(snShotLaserAll,2.65);
		laserSoundLoopInst = audio_play_sound(snShotLaserAll, 600, true);
	}

	//turn sound off
	if laserSoundLoop == false and audio_is_playing(laserSoundLoopInst)
	{
		audio_stop_sound(laserSoundLoopInst);
		audio_play_sound(snShotLaserEd, 600, false);
	}

	laserSoundLoop = false;



	//wall slide
	if wallslidesound == true and !audio_is_playing(wallslidesoundinst)
	{
		wallslidesoundinst = audio_play_sound(snWallSlide, 1000, true);
	}

	//turn sound off
	if wallslidesound == false and audio_is_playing(wallslidesoundinst)
	{
		audio_stop_sound(wallslidesoundinst);
	}

	wallslidesound = false;
	
	//Grind slide
	if grindslide == true and !audio_is_playing(grindslideinst)
	{
		grindslideinst = audio_play_sound(snGrind, 1000, true);
	}

	//turn sound off
	if grindslide == false and audio_is_playing(grindslideinst)
	{
		audio_stop_sound(grindslideinst);
	}

	grindslide = false;
	
		//chainsaw sound
	if chainsawLoop == true and !audio_is_playing(chainsawLoopInst)
	{
		audio_sound_loop_start(snChainsawLoop,0.28);
		audio_sound_loop_end(snChainsawLoop,1.56);
		chainsawLoopInst = audio_play_sound(snChainsawLoop, 800, true);
	}

	//turn sound off
	if chainsawLoop == false and audio_is_playing(chainsawLoopInst)
	{
		audio_stop_sound(chainsawLoopInst);
		audio_play_sound(snChainsawEnd, 600, false);
	}

	chainsawLoop = false;
	

	
	
	//rocket trail
	if rocketloop == true and !audio_is_playing(rocketloopinst)
	{
		rocketloopinst = audio_play_sound(snShotRocketLoop, 800, true);
	}

	//turn sound off
	if rocketloop == false and audio_is_playing(rocketloopinst)
	{
		audio_stop_sound(rocketloopinst);
	}

	rocketloop = false;


	//plane fall
	if planefall == true and !audio_is_playing(planefallinst)
	{
		planefallinst = audio_play_sound(snPlaneFall, 800, true);
	}

	//turn sound off
	if planefall == false and audio_is_playing(planefallinst)
	{
		audio_stop_sound(planefallinst);
	}

	planefall = false;
	
				//flamethrower sound
	if flamethrowerloop == true and !audio_is_playing(flamethrowerloopInst)
	{
		
		audio_sound_loop_start(snFlamethrower,0.64);
		audio_sound_loop_end(snFlamethrower,1.92);
		flamethrowerloopInst = audio_play_sound(snFlamethrower, 800, true);
	}

	//turn sound off
	if flamethrowerloop == false and audio_is_playing(flamethrowerloopInst)
	{
		audio_stop_sound(flamethrowerloopInst);
		//audio_play_sound(snChainsawEnd, 600, false);
	}

	flamethrowerloop = false;