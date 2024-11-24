
input_axis_threshold_set(gp_axislh,0.30,0.95);
input_axis_threshold_set(gp_axislv,0.50,0.95);

active = 0;
myInfo = noone;

//custom functions for player
function setOnGround(_val = true) //set if on ground or not
{
	if _val == true
	{
		onGround = true;	
	} else {
		onGround = false;
		myPlat = noone;
	}
}

function checkCollSemi(_x, _y)
{
	//create a return variable
	var _rtrn = noone;
	
	//must not be moving up
	if vsp >= 0 and place_meeting(_x,_y,oCollSemi)
	{
		//create ds list
		var _list = ds_list_create();
		var _listSize = instance_place_list(_x, _y, oCollSemi, _list, false)
		
		//loop
		for (var i = 0; i < _listSize; i++)
		{
			var _listInst = _list[| i];
			if floor(bbox_bottom) <= ceil(_listInst.bbox_top - _listInst.yspd)
			{
				//return id of a semisolid platform
				_rtrn = _listInst;
				i = _listSize;
			}
		}
		ds_list_destroy(_list);
	}
	//return variable
	return _rtrn;
}

function squishNewt(xscale,yscale)
{
	drawXscale = xscale;	
	drawYscale = yscale;
}

global.newtCenter = y-((bbox_bottom-bbox_top)/2);

controlsSetup();

if !layer_exists("Weapon") layer_create(-1000, "Weapon");
if !layer_exists("Shots") layer_create(-1001, "Shots");
if !layer_exists("GUI") layer_create(-9999, "GUI");
if !layer_exists("Player") layer_create(-999, "Player");

mouthOpen = false;
mouthTimer = 0;
sprWalk = sNewtWalk;
sprJump = sNewtAir;
sprIdle = sNewtIdle;
sprSPD = 1;

visdist = 0;
depth = -999;

prop = noone;
propBuffer = 0;

indfrac = 0;
godmode = false;

nearestCorpse = noone;
myCorpse = noone;

sodaToss = false
flash = 0;
blood = 0;
lit = 0;

key_down = 0;
mouseRight = false;

hsp = 0;		//horizontal speed
vsp = 0;		//vertical speed
hspFrac = 0;
vspFrac = 0;

hspAcc[0] = 0.75;
hspAcc[1] = 1.25;
hspAcc[2] = 0.01;
hspFricGround = 0.75;
hspFricAir = 0.01;
moveType = 0;
hspWalk= 7;

hspWJump = 7;

headerAlpha = 1;
sodaDesc = "";

vspJump = -7;

vspMax = 20;
vspWJump = -8;
vspMaxWall = 4

jumpMax = 1 + oInv.extraJumps;

jumpCount = 0;
jumpHoldTimer = 0;
jumpHoldFrames = 16;

grv[0] = 0.475;		//normal gravitygravity
grv[1] = 0.1;	//slide gravity for jumping off ramps
grv[2] = 0;
grvWall = 0.5;	//wall friction

jumpBuffer = 0;	//can you jump now 
wallJumpDelay = 0;
wallJumpDelayMax = 17;

onGround = false;
onWall = 0;
crouching = false;
grind = false;
grindSpeed = 13;
midGrind = 0;
forgetPlat = noone;	

drawXscale = 1;
drawYscale = 1;
rot = 0;

exclam = false; //should interest marker show up
hasControl = true; //can you move
inspect = false;

facingRight = 1;

iFramesReset = 60;
iFrames = iFramesReset;

slime = 0;
nearestWeapon = noone
randomWand = false;

bloodMeter = 0;
bloodMax = 300;

inRoom = false
sodaGot = 0;

dashX = 0;
dashY = 0;
dashFacing = 0;

dashTimer = 7;
dashReset = dashTimer;
dashMaxSpd = 17;
dashCooldown = 90;

dashMax = 2;
dashCount = dashMax;

//ui bits
gArr[0] = oInv;
gArr[1] = oHealthBar;
gArr[2] = oAmmoCount;
gArr[3] = oExpBar;
gArr[4] = oWeapon;
gArr[5] = oExclam;
gArr[6] = oShotSniperLaser;
//gArr[7] = oMusicManager;

//player States
stateFree = function()
{
	mask_index = sNewt;
	if (jumpCount < jumpMax) and input_check_pressed("jump")
	{
		drawXscale = 0.75;
		drawYscale = 1.5;
	}
	
	if (dashCount < 2) and onGround {dashCount = 2};
	
	if input_check_pressed("interact") or input_check_pressed("special")
	{
		//if !collision_circle(x,global.newtCenter,48,oCorpse,0,0) or !collision_circle(x,global.newtCenter,48,oWeaponPickup,0,0)
		//{
		//	oSFX.mouthpop = true;
		//}
		
		squishNewt(1.05,0.95);	
	}
	
	if input_check("interact") or input_check("special")
	{
		mouthOpen = true;	
	}else mouthOpen = false;	
	
	rot = -hsp*1.5;
	
	//while standing resets
	with oCamera {curBuff = buff[0]};
	image_angle = 0;	
	
	//init if backwards or not 
	var _backwards = false

	//calculate horizontal movement
	wallJumpDelay = max(wallJumpDelay-1,0);
	if (wallJumpDelay ==0)
	{
		gamepad_set_axis_deadzone(4,0.25);
		var dir = (input_value("right")-input_value("left"));
		hsp += dir * hspAcc[moveType];
	
		if (dir == 0)
		{
			var hspFricFinal = hspFricGround;
			if (!onGround) hspFricFinal = hspFricAir;
			hsp = approach(hsp,0,hspFricFinal);
		}
		
		
		
		if abs(hsp > hspWalk)
		{
			hsp = lerp(hsp,hspWalk,0.5);
		}
		else 
		if abs(hsp < -hspWalk)
		{
			hsp = lerp(hsp,-hspWalk,0.5);
		}
		
		hsp = clamp(hsp*oInv.spdMod, -24, 24);
	}

	//wall jump stuff
	if (onWall != 0) && (!onGround) && input_check_pressed("jump")
	{
		wallJumpDelay = wallJumpDelayMax;
		hsp = -onWall * hspWJump;
		vsp = vspWJump;
		oSFX.newtjump = true;
		hspFrac = 0;
		vspFrac = 0;
	
		repeat(6)
			{
				with (instance_create_layer(x,bbox_top, "Player", oSlime))
				{
					hsp =  random_range(oNewt.hsp/2, oNewt.hsp);
					vsp = random_range(-1,-5);
					image_speed = slimeDecay;
				}		
			}
	}

	//calculate vertical movement
	var grvFinal = grv[0];
	var vspMaxFinal = vspMax;
	if (onWall != 0) && (vsp > 0)
	{
		oSFX.wallslidesound = true;

		grvFinal = grvWall;
		vspMaxFinal = vspMaxWall;	
	}
	vsp += grvFinal;

	//ground jumping

	if jumpCount > 1
	{
		jumpHoldFrames = 16;
		vspJump = -5;	
	}
	else
	{
		jumpHoldFrames = 12;
		vspJump = -7;	
	}

	//reset double jump
	if onGround
	{
	jumpCount = 0;	
	jumpHoldTimer = 0;
	}
	else
	{
	 if jumpCount == 0 {jumpCount = 1};	
	}

	jumpBuffer--;
	if(jumpKeyBuffered) and (jumpCount < jumpMax)
	{
		jumpBuffer = 0;
		jumpKeyBuffered = false;
		jumpKeyBufferTimer = 0;
		
		jumpCount++;
		
		////set the jump hold timer
		jumpHoldTimer = jumpHoldFrames;
		setOnGround(false);
		
		audio_play_sound(snSquish8,500,false);
		audio_sound_pitch(snSquish8,random_range(0.8,1.2));
		
		repeat(10)
		{
			with (instance_create_layer(x,bbox_bottom, "Player", oSlime))
			{
				jump = true;
				image_speed = slimeDecay;
			}	
		}
	}
	//jump based on hold button
	if jumpHoldTimer > 0
	{
		
		vsp = vspJump;
		vspFrac = 0;
		jumpHoldTimer--;	
	}
	
		if !input_check("jump")
	{
		jumpHoldTimer = 0;	
	}
	
	vsp = clamp(vsp,-vspMax,vspMax);
	//}

	//dump fractions and get final integer speeds
	hsp += hspFrac;
	vsp += vspFrac;
	hspFrac = frac(hsp);
	vspFrac = frac(vsp);
	hsp -= hspFrac;
	vsp -= vspFrac;

	//horizontal collision
		var subpixel = .5;

	if (place_meeting(x+hsp,y,oCollide))
	{
		var onepixel = sign(hsp);
	
		//first check if theres slope or not
		if !place_meeting( x + hsp, y - abs(hsp)-1.5, oCollide)
		{
			while (place_meeting(x+hsp,y,oCollide))	{y -= subpixel}
		}
		else
		{
			//ceiling slopes
			if !place_meeting(x + hsp, y + abs(hsp)+1, oCollide) 
			{
				while place_meeting(x+hsp, y, oCollide) {y+= subpixel};
			}
			//normal x collide
			else
			{
				var pixelcheck = subpixel*sign(hsp);
				while (!place_meeting(x+pixelcheck,y,oCollide)) x += pixelcheck;
		
				hsp = 0;
				hspFrac = 0;	
			}	
		}
	}

	//go down slopes
	downSlopeSemi = noone;
	if (vsp >= 0) and !place_meeting(x + hsp, y+1, oCollide) and place_meeting(x+hsp, y+abs(hsp)+1, oCollide)
	{
		//check if semisolid in the way
		downSlopeSemi = checkCollSemi(x+hsp, y+abs(hsp)+1);
		//precisely move down slope if there isnt a semisolid in the way
		if instance_exists(downSlopeSemi)
		{
			while !place_meeting(x +hsp, y+ subpixel, oCollide){y+= subpixel};
		}
	}

	//horizontal move
	x += hsp;

//----------old vertical collision------------------------//
	//vertical collision
	if (place_meeting(x,y+vsp,oCollide))
	{
		var onepixel = sign(vsp);
		var pixelcheck = subpixel*sign(vsp);
	
		while (!place_meeting(x,y+pixelcheck,oCollide)) y += pixelcheck;
	
		//bonk code
		if (vsp < 0){jumpHoldTimer = 0; oSFX.mariobump = true};
	
		vsp = 0;
		vspFrac = 0;
	}
	
//------new vertical colission---------------------------//
	
	//floor y collide
	
	//check for solid and semisolid platforms under me
	var _clampYspd = max(0,vsp);
	var _list = ds_list_create(); //create list of platforms
	var _array = array_create(0);
	array_push(_array, oCollide, oCollSemi);
	
	//do the check, add objects to list
	var _listSize = instance_place_list(x, y +1 +_clampYspd +vspMax, _array, _list, false);
	
	var _ycheck = y+1 + _clampYspd;
	if instance_exists(myPlat){_ycheck += max(0, myPlat.yspd)};
	var _semiSolid = checkCollSemi(x, _ycheck);
	
	//loop through instances, only return one applicable to player
	for(var i = 0; i< _listSize; i++ )
	{
		//get instance of oCollide or oCollSemi from List
		var _listInst = _list[| i ];
		
		//avoid magnetism
		if  (_listInst.yspd <= vsp or instance_exists(myPlat))
		and (_listInst.yspd > 0 or place_meeting(x,y+1+_clampYspd,_listInst))
		{
			//return a solid wall or any semisolid walls that are below the player
			if _listInst.object_index == oCollide
			or object_is_ancestor( _listInst.object_index, oCollide )
			or floor(bbox_bottom) <= ceil(_listInst.bbox_top - _listInst.yspd)
			{
				//return "highest" wall object
				if !instance_exists(myPlat)
				or _listInst.bbox_top + _listInst.yspd <= myPlat.bbox_top + myPlat.yspd
				or _listInst.bbox_top + _listInst.yspd <= bbox_bottom
				{
					myPlat = _listInst;
				}
			}
		}
	}
	//loop over, destroy list to prevent memory leak
	ds_list_destroy(_list);
	
	//downslope semisolid for making sure we dont miss semisolids while going down slopes
	if instance_exists(downSlopeSemi){myPlat = downSlopeSemi};
	
	//one last check to make sure floor platform is below us
	if instance_exists(myPlat) and !place_meeting(x, y+vspMax, myPlat)
	{
		myPlat = noone;	
	}
	
	//land on ground if there is one
	if instance_exists(myPlat)
	{
		//check precisely wall collision
		var _subPixel = .5;
		while !place_meeting(x,y+_subPixel,myPlat) and !place_meeting(x,y,oCollide){y+= _subPixel};
		//make sure we dont end up below the top of a semisolid
		if myPlat.object_index == oCollSemi or object_is_ancestor(myPlat.object_index, oCollSemi)
		{
			while place_meeting(x,y, myPlat){y-= _subPixel}	
		}
		y = floor(y);
		
		//collide with the ground
		vsp = 0;
		vspFrac = 0;
		setOnGround(true);
	}else setOnGround(false);
	
	//vertical move
	y += vsp;
	
//final movcing platforms coll and movement
	//X - moveplatXspd
	//get moveplatXspd
	movePlatXspd = 0;
	if instance_exists(myPlat) {movePlatXspd = myPlat.xspd;};

	if (place_meeting(x+movePlatXspd,y,oCollide))
	{
		var _subPixel = .5;
		var _pixelCheck = _subPixel * sign(movePlatXspd);
		while !place_meeting(x + _pixelCheck, y, oCollide)
		{
			x+= _pixelCheck	
		}
		movePlatXspd = 0;
	}
	x += movePlatXspd;

	//Y - snapping	
	if instance_exists(myPlat) and myPlat.yspd != 0
	{
		//snap to top of floor (onfloor the y)
		if !place_meeting(x,myPlat.bbox_top, oCollide)
		and myPlat.bbox_top >= bbox_bottom-vspMax
		{
				y = myPlat.bbox_top;
		}
		
		//going up into a solid wall while on a semisolid platform
		if myPlat.yspd < 0 and place_meeting(x,y+myPlat.yspd,oCollide)
		{
				//get pushed down
			if myPlat.object_index == oCollSemi or object_is_ancestor(myPlat.object_index, oCollSemi)
			{
				//get puished down
				var _subpixel = 0.25;
				while place_meeting(x,y+myPlat.yspd, oCollide){y+=_subpixel};
				
				//if we got pushed into a solid wall while going down, push back out
				while place_meeting(x,y,oCollide){y-=_subPixel};
				y=round(y);
			}
			//cancel myPlat
			setOnGround(false);
		}
	}
	
	//calc current status
	onWall = place_meeting(x+1,y,oCollide) - place_meeting(x-1,y,oCollide);
	if (onGround) jumpBuffer = 10;
	
	//walk sound
	if (sprite_index = sprWalk) and (image_index == 1) or (image_index == 4)
	{
		oSFX.walksplat = true;
		repeat(2)
		{
			with (instance_create_layer(x,bbox_bottom, "Player", oSlime)){vsp = 0};		
		}
	}

	if hasControl
	{	
		var xAim = input_value("aim_right") - input_value("aim_left")
		if input_gamepad_is_any_connected() and global.inputdevice = "gamepad"
		{
			//adjust current sprite
			if (hsp > 0 and oCursor.x < x) _backwards = true;
			if (hsp < 0 and oCursor.x > x) _backwards = true;
			if _backwards && (place_meeting(x,y+1,oCollide)) {sprSPD *= sign(hsp)}//if walking backwards, play animation backwards
			
			if xAim !=0
			{
				if xAim < 0 
				{
					image_xscale = -1;
					facingRight = -1;	
				}
				else
				{
					image_xscale = 1;	// if mouse is to left, face left and vice versa
					facingRight = 1;
				}
			}
		}
		else
		{
			//adjust current sprite
			if (hsp > 0 && mouse_x < x) _backwards = true;
			if (hsp < 0 && mouse_x > x) _backwards = true;
			if _backwards && (place_meeting(x,y+1,oCollide)) {sprSPD = sprSPD*-1} else sprSPD = 1 //if walking backwards, play animation backwards
			
			if (mouse_x < x)
			{
				image_xscale = -1;
				facingRight = -1;
			}
				else 
			{
				image_xscale = 1;	// if mouse is to left, face left and vice versa
				facingRight = 1;
			}
		}
	} //else sprSPD = 1;

	drawXscale = lerp(drawXscale,1,0.1);
	drawYscale = lerp(drawYscale,1,0.1);

	//wall jump sprites
	if(!onGround)
	{
		if (onWall != 0)
		{
			sprite_index = sNewtWall;
			image_xscale = onWall;
		
			var side = bbox_left;
			if (onWall == 1) side = bbox_right;
			slime += 2;
		
			if ((slime > 2) && (vsp > 0)) with (instance_create_layer(side,bbox_top, "Player",oSlimeSlide))
			{
				other.slime = 0;
				hspeed = random_range(-other.onWall*0.7,-other.onWall*0.1);
			}
		}
		else
		{
			slime = 0;
			sprite_index = sprJump;
			//image_speed = 0;
			image_index = (vsp > 0);			
		}
	}
	else
	{
		if (sprite_index == sprJump) 
		{
			drawYscale = 0.75;
			drawXscale = 1.25;
			audio_play_sound(snLand,300,0);
			repeat(10)
			{
				with (instance_create_layer(x,bbox_bottom, "Player", oSlime))
				{
					vsp = 0;
					hsp = choose(5, -5);
					image_speed = slimeDecay;
				}		
			}
		}
	
		if (hsp != 0) 
		{
			sprite_index = sprWalk;
		}else 
		{
			sprite_index = sprIdle;
			image_index += indfrac;
			indfrac = frac(image_index);
			image_index -= indfrac;	
		}
	}

	//smooshed face sprite
	if ((onWall !=0) and onGround)
	{
		if (place_meeting(x+facingRight,y-25,oCollide))
		sprite_index = sNewtSquish;
	}
	
	if sprite_index == sprIdle and image_index = 21
	{
		squishNewt(1.05,0.95);
	}
	
	//crouching
	if input_check("down")// and (onWall == 0) 
	{
		midGrind = 0;
		hsp *= 1.5
		state = stateCrouch;
		squishNewt(1.15,0.85);
	}
	
	if (global.soda[5] = true) and input_check_pressed("dash") and (dashCount > 0) //and (onWall == 0) 
	{
		
		
		dashX = (input_check("right") - input_check("left"));
		dashY = (input_check("down") - input_check("up"));
		
		if (dashX ==0 and dashY ==0) or dashX !=0
		{
			squishNewt(1.75,0.85);	
		}
		else if dashY != 0
		{
			squishNewt(0.65,2);
		}
		
		if dashY < 0
		{
			setOnGround(false);
			y--;	
		}
		
		dashFacing = facingRight;
		
		oSFX.wooshBasic = true;
		state = stateDash;
		
	}
	
	if instance_exists(oCorpse) and !oInv.full and mouthTimer < 1
	{
		nearestCorpse = instance_nearest(x,y,oCorpse);
		
		if collision_circle(x,y,48,nearestCorpse,0,0) and (nearestCorpse.alpha != 0) and !nearestCorpse.big and input_check_pressed("interact")
		{
			
			squishNewt(1.25,0.75);
			audio_play_sound(snGULP,750,false);
			state = stateGulp;
		}
	}
	
	if oInv.inBelly > 0 and input_check_pressed("special")
	{
		oInv.full = 0;
		
		audio_play_sound(snBurp,500,false);
		with oInv.inBelly
		{
			hsp = 5*oNewt.facingRight;
			image_xscale = oNewt.facingRight*size;
			image_yscale = image_yscale*size;
			vsp = -4;
			x = oNewt.x;
			y = oNewt.y-36;
			inBelly = false;
			done = 0;
		}
		oInv.inBelly = noone;
	}
}

stateCrouch = function()
{
	mask_index = sNewtCrouch;
	if !input_check("down")
	{
		if onGround
		{
			squishNewt(0.90,1.10);
			setOnGround(false);
		}
		state = stateFree;
	}
	
	rot = lerp(rot,0,0.1);
	drawXscale = lerp(drawXscale,1,0.1);
	drawYscale = lerp(drawYscale,1,0.1);
	
	if abs(vsp) != 0 {setOnGround(false)}
	//if abs(hsp) > 24 {hsp = clamp(hsp,-22,22);}
	if abs(hsp) > grindSpeed{grind = true;}else grind = false;
	
	if onGround and (hsp != 0) //if sliding
	{			
		with oCamera {curBuff = max(curBuff - curBuff/4,buff[1])};
		image_index = 0;
		image_xscale = sign(hsp);
		facingRight = sign(hsp);
		
		if !grind
		{
			oSFX.wallslidesound = true;
			repeat(3)
			{
				with (instance_create_layer(x + hsp*2.5,bbox_bottom, "Player",oSlime))
				{
					hsp = random_range(-other.onWall*0.7,-other.onWall*0.1);
				}
			}
		}
		else
		{
			if midGrind != 1 
			{
				oSFX.grindland = true; 
				midGrind = 1;
				flash = 1;	
				iFrames = 6;
			};
			
			if onGround
			{
				screenShake(1,2);
				oSFX.grindslide = true;
				repeat(3)
				{
					with (instance_create_layer(x + hsp*1.5,bbox_bottom, "Shots",oSparks))
					{
						hsp = random_range(-other.onWall*0.7,-other.onWall*0.1);
						speed = random(4)
						image_angle = 180*sign(other.hsp) + random_range(-45, 45);
					}
				}
			}
		}
	}else //if crouching
	{
		onGround = place_meeting(x,y+1,oCollide);
		if onGround{hsp *= 1.5};
		hsp *= 0.99;		
		image_index = 1;
	}
	
	//hsp *= 0.98;
	sprite_index = sNewtCrouch;
	global.newtCenter = y-11;
	
	
	
	//calculate vertical movement
	var grvFinal = grv[0];
	var vspMaxFinal = vspMax;
	if (onWall != 0) && (vsp > 0)
	{
		grvFinal = grvWall;
		vspMaxFinal = vspMaxWall;	
	}
	vsp += grvFinal;

	//ground jumping

	//reset double jump
	if onGround
	{
	jumpCount = 0;	
	jumpHoldTimer = 0;
	}
	else
	{
	 if jumpCount == 0 {jumpCount = 1};	
	}

	jumpBuffer--;
	if(jumpKeyBuffered) and (jumpCount < jumpMax)
	{
		jumpBuffer = 0;
		jumpKeyBuffered = false;
		jumpKeyBufferTimer = 0;
		
		jumpCount++;
		
		////set the jump hold timer
		jumpHoldTimer = jumpHoldFrames;
		//tell outselkf we are no longer on the ground
		setOnGround(false);
		
		audio_play_sound(snSquish8,500,false);
		audio_sound_pitch(snSquish8,random_range(0.8,1.2));
		
		repeat(10)
		{
			with (instance_create_layer(x,bbox_bottom, "Player", oSlime))
			{
				jump = true;
				hsp = oNewt.hsp;
				image_speed = slimeDecay;
			}		
		}
	}
	//jump based on hold button
	if jumpHoldTimer > 0
	{
		vsp = vspJump;
		vspFrac = 0;
		jumpHoldTimer--;	
	}
	
		if !input_check("jump")
	{
		jumpHoldTimer = 0;	
	}
	
	vsp = clamp(vsp,-vspMax,vspMax);
	//}

	//dump fractions and get final integer speeds
	hsp += hspFrac;
	vsp += vspFrac;
	hspFrac = frac(hsp);
	vspFrac = frac(vsp);
	hsp -= hspFrac;
	vsp -= vspFrac;

	//horizontal collision
		var subpixel = .5;

	if (place_meeting(x+hsp,y,oCollide))
	{
		var onepixel = sign(hsp);
	
		//first check if theres slope or not
		if !place_meeting( x + hsp, y - abs(hsp)-1, oCollide)
		{
			while (place_meeting(x+hsp,y,oCollide))	{y -= subpixel}
		}
		else
		{
			//ceiling slopes
			if !place_meeting(x + hsp, y + abs(hsp)+1, oCollide) 
			{
				while place_meeting(x+hsp, y, oCollide) {y+= subpixel};
			}
			//normal x collide
			else
			{
				var pixelcheck = subpixel*sign(hsp);
				while (!place_meeting(x+pixelcheck,y,oCollide)) x += pixelcheck;
		
				hsp = 0;
				hspFrac = 0;	
			}	
		}
	}

	//go down slopes
	downSlopeSemi = noone;
	if (vsp >= 0) and !place_meeting(x + hsp, y+1, oCollide) and place_meeting(x+hsp, y+abs(hsp)+1, oCollide)
	{
		//check if semisolid in the way
		downSlopeSemi = checkCollSemi(x+hsp, y+abs(hsp)+1);
		//precisely move down slope if there isnt a semisolid in the way
		if instance_exists(downSlopeSemi)
		{
			while !place_meeting(x +hsp, y+ subpixel, oCollide){y+= subpixel};
		}
	}

	//horizontal move
	x += hsp;

	//vertical collision
	if (place_meeting(x,y+vsp,oCollide))
	{
		var onepixel = sign(vsp);
		var pixelcheck = subpixel*sign(vsp);
		
		image_angle = 0;
		
		while (!place_meeting(x,y+pixelcheck,oCollide)) y += pixelcheck;
	
		//bonk code
		if (vsp < 0){jumpHoldTimer = 0; oSFX.mariobump = true};
	
		vsp = 0;
		vspFrac = 0;
	}

	if instance_exists(myPlat)
	and (myPlat.object_index == oCollSemi or object_is_ancestor(myPlat.object_index, oCollSemi))
	{
		var _yCheck = max(1, myPlat.yspd+1);
		if !place_meeting(x, y+_yCheck, oCollide)
		{
			//move below platform
			y+=1;
			
			//inherit downward speed to not catch
			vsp = _yCheck-1;
			
			//forget this platform
			forgetPlat = myPlat;
			
			//no more floor 
			setOnGround(false);
		}
	}

	//vertical move
	y += vsp;
	
	//reset forgetSemi
	if instance_exists(forgetPlat) and !place_meeting(x, y, forgetPlat)
	{
		forgetPlat = noone;	
	}

	//calc current status
	if (onGround) jumpBuffer = 10;
	
	if (global.soda[5] = true) and input_check_pressed("dash") and (dashCount > 0) and !onGround
	{
		
		dashX = (input_check("right") - input_check("left"));
		dashY = (input_check("down") - input_check("up"));
		dashFacing = facingRight;
		
		if dashY < 0
		{
			setOnGround(false);
			y--;	
		}
		
		oSFX.wooshBasic = true;
		state = stateDash;
		squishNewt(1.15,0.85);
	}
	
}

stateDash = function()
{
	
	if dashTimer > 0
	{
		sprite_index = sNewtWallFlip;
		
		with instance_create_depth(x,y,depth-15,oCloneTrail)
		{
			owner = other.id; 
			col=c_aqua; 
			add = true;
			blink = true;
			xFrames = 2;
			xReset = xFrames;
		};
		
		iFrames = 1;
		hsp = clamp(hsp*20,-20,20);
		
		if (dashX == 0) and (dashY ==0)
		{
			hsp = dashFacing*20;
			vsp = 0;
		}
		else
		{
			hsp = dashX*20;
			vsp = clamp(dashY*20,-12,23);
		}
		////up dash
		//if input_check("up") and !input_check("down")
		//{
		//	setOnGround(false);
		//	//if not pressing left or right cancel all horizontal movement
		//	if !(input_check("left") or input_check("right")) 
		//	{hsp = 0}
			
			
		//	//apply dash speed vertically
		//	vsp = clamp(vsp-8,-10,10);
		//}
		
		////down dash
		//if input_check("down") and !(input_check("jump") or input_check("up"))
		//{
		//	//if not pressing left or right cancel all horizontal movement
		//	if !(input_check("left") or input_check("right")) {hsp = 0};
			
		//	//apply dash speed vertically
		//	vsp	= clamp(vsp+16,-10,10);
		//}
		
		////left dash
		//if input_check("left")
		//{
		//	//if not pressing left or right cancel all horizontal movement
		//	if !(input_check("down") or input_check("jump") or input_check("up")) {vsp = 0};
			
		//	//apply dash speed vertically
		//	hsp = clamp(hsp-23,-dashMaxSpd,dashMaxSpd);
		//}
		
		////left dash
		//if input_check("right")
		//{
		//	//if not pressing left or right cancel all horizontal movement
		//	if !(input_check("down") or input_check("jump") or input_check("up")) {vsp = 0};
			
		//	//apply dash speed vertically
		//	hsp = clamp(hsp+23,-dashMaxSpd,dashMaxSpd);
		//}
		
		//if !(input_check("left") or input_check("right") or input_check("down") or input_check("jump") or input_check("up"))
		//{
		//	vsp = 0;
		//	hsp = clamp(facingRight*100,-dashMaxSpd,dashMaxSpd);
		//}
		
	}
	else
	{
		dashCount--;
		
		
		
		state = stateFree;
		dashTimer = dashReset;
	}
	dashTimer--;
	
	//while standing resets
	with oCamera {curBuff = buff[0]};
	image_angle = 0;	
	
	//init if backwards or not 
	var _backwards = false
	
	////sprint toggle
	//if input_check("runtoggle") {global.autoRun = !global.autoRun};
	////sprint
	//if (global.autoRun){moveType = 1; image_speed = 10} else {moveType = 0; image_speed = 1};

	
	

	//calculate vertical movement
	var grvFinal = grv[2];
	var vspMaxFinal = vspMax;
	if (onWall != 0) && (vsp > 0)
	{
		oSFX.wallslidesound = true;

		grvFinal = grvWall;
		vspMaxFinal = vspMaxWall;	
	}
	vsp += grvFinal;
	
	vsp = clamp(vsp,-vspMax,vspMax);
	//}

	//dump fractions and get final integer speeds
	hsp += hspFrac;
	vsp += vspFrac;
	hspFrac = frac(hsp);
	vspFrac = frac(vsp);
	hsp -= hspFrac;
	vsp -= vspFrac;

	//horizontal collision
		var subpixel = .5;

	if (place_meeting(x+hsp,y,oCollide))
	{
		var onepixel = sign(hsp);
	
		//first check if theres slope or not
		if !place_meeting( x + hsp, y - abs(hsp)-1.5, oCollide)
		{
			while (place_meeting(x+hsp,y,oCollide))	{y -= subpixel}
		}
		else
		{
			//ceiling slopes
			if !place_meeting(x + hsp, y + abs(hsp)+1, oCollide) 
			{
				while place_meeting(x+hsp, y, oCollide) {y+= subpixel};
			}
			//normal x collide
			else
			{
				var pixelcheck = subpixel*sign(hsp);
				while (!place_meeting(x+pixelcheck,y,oCollide)) x += pixelcheck;
		
				hsp = 0;
				hspFrac = 0;	
			}	
		}
	}

	//go down slopes
	downSlopeSemi = noone;
	if (vsp >= 0) and !place_meeting(x + hsp, y+1, oCollide) and place_meeting(x+hsp, y+abs(hsp)+1, oCollide)
	{
		//check if semisolid in the way
		downSlopeSemi = checkCollSemi(x+hsp, y+abs(hsp)+1);
		//precisely move down slope if there isnt a semisolid in the way
		if instance_exists(downSlopeSemi)
		{
			while !place_meeting(x +hsp, y+ subpixel, oCollide){y+= subpixel};
		}
	}

	//horizontal move
	x += hsp;

//----------old vertical collision------------------------//
	//vertical collision
	if (place_meeting(x,y+vsp,oCollide))
	{
		var onepixel = sign(vsp);
		var pixelcheck = subpixel*sign(vsp);
	
		while (!place_meeting(x,y+pixelcheck,oCollide)) y += pixelcheck;
	
		//bonk code
		if (vsp < 0){jumpHoldTimer = 0; oSFX.mariobump = true};
	
		vsp = 0;
		vspFrac = 0;
	}
	
//------new vertical colission---------------------------//
	
	//floor y collide
	
	//check for solid and semisolid platforms under me
	var _clampYspd = max(0,vsp);
	var _list = ds_list_create(); //create list of platforms
	var _array = array_create(0);
	array_push(_array, oCollide, oCollSemi);
	
	//do the check, add objects to list
	var _listSize = instance_place_list(x, y +1 +_clampYspd +vspMax, _array, _list, false);
	
	var _ycheck = y+1 + _clampYspd;
	if instance_exists(myPlat){_ycheck += max(0, myPlat.yspd)};
	var _semiSolid = checkCollSemi(x, _ycheck);
	
	//loop through instances, only return one applicable to player
	for(var i = 0; i< _listSize; i++ )
	{
		//get instance of oCollide or oCollSemi from List
		var _listInst = _list[| i ];
		
		//avoid magnetism
		if  (_listInst.yspd <= vsp or instance_exists(myPlat))
		and (_listInst.yspd > 0 or place_meeting(x,y+1+_clampYspd,_listInst))
		{
			//return a solid wall or any semisolid walls that are below the player
			if _listInst.object_index == oCollide
			or object_is_ancestor( _listInst.object_index, oCollide )
			or floor(bbox_bottom) <= ceil(_listInst.bbox_top - _listInst.yspd)
			{
				//return "highest" wall object
				if !instance_exists(myPlat)
				or _listInst.bbox_top + _listInst.yspd <= myPlat.bbox_top + myPlat.yspd
				or _listInst.bbox_top + _listInst.yspd <= bbox_bottom
				{
					myPlat = _listInst;
				}
			}
		}
	}
	//loop over, destroy list to prevent memory leak
	ds_list_destroy(_list);
	
	//downslope semisolid for making sure we dont miss semisolids while going down slopes
	if instance_exists(downSlopeSemi){myPlat = downSlopeSemi};
	
	//one last check to make sure floor platform is below us
	if instance_exists(myPlat) and !place_meeting(x, y+vspMax, myPlat)
	{
		myPlat = noone;	
	}
	
	//land on ground if there is one
	if instance_exists(myPlat)
	{
		//check precisely wall collision
		var _subPixel = .5;
		while !place_meeting(x,y+_subPixel,myPlat) and !place_meeting(x,y,oCollide){y+= _subPixel};
		//make sure we dont end up below the top of a semisolid
		if myPlat.object_index == oCollSemi or object_is_ancestor(myPlat.object_index, oCollSemi)
		{
			while place_meeting(x,y, myPlat){y-= _subPixel}	
		}
		y = floor(y);
		
		//collide with the ground
		vsp = 0;
		vspFrac = 0;
		setOnGround(true);
	}else setOnGround(false);
	
	//vertical move
	y += vsp;
	
//final movcing platforms coll and movement
	//X - moveplatXspd
	//get moveplatXspd
	movePlatXspd = 0;
	if instance_exists(myPlat) {movePlatXspd = myPlat.xspd;};

	if (place_meeting(x+movePlatXspd,y,oCollide))
	{
		var _subPixel = .5;
		var _pixelCheck = _subPixel * sign(movePlatXspd);
		while !place_meeting(x + _pixelCheck, y, oCollide)
		{
			x+= _pixelCheck	
		}
		movePlatXspd = 0;
	}
	x += movePlatXspd;

	//Y - snapping	
	if instance_exists(myPlat) and myPlat.yspd != 0
	{
		//snap to top of floor (onfloor the y)
		if !place_meeting(x,myPlat.bbox_top, oCollide)
		and myPlat.bbox_top >= bbox_bottom-vspMax
		{
				y = myPlat.bbox_top;
		}
		
		//going up into a solid wall while on a semisolid platform
		if myPlat.yspd < 0 and place_meeting(x,y+myPlat.yspd,oCollide)
		{
				//get pushed down
			if myPlat.object_index == oCollSemi or object_is_ancestor(myPlat.object_index, oCollSemi)
			{
				//get puished down
				var _subpixel = 0.25;
				while place_meeting(x,y+myPlat.yspd, oCollide){y+=_subpixel};
				
				//if we got pushed into a solid wall while going down, push back out
				while place_meeting(x,y,oCollide){y-=_subPixel};
				y=round(y);
			}
			//cancel myPlat
			setOnGround(false);
		}
	}
	
}

stateGulp = function()
{
	mouthTimer = 10;
	sprite_index = sNewtFlap;
	
	
	if nearestCorpse.id.fresh > 0 
	{
		oInv.inBelly = nearestCorpse.id;
		nearestCorpse.inBelly = true;
	}else state = stateFree
}

state = stateFree;

//moving platforms
myPlat = noone;
movePlatXspd = 0;


