
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
if !layer_exists("GUI") layer_create(-9999, "GUI");
if !layer_exists("Player") layer_create(-999, "Player");


visdist = 0;
depth = -999;

indfrac = 0;

sodaToss = false
flash = 0;
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
hspFricGround = 0.50;
hspFricAir = 0.01;
moveType = 0;
hspWalk[0] = 5;
hspWalk[1] = 7;
hspWalk[2] = 1;
hspWJump = 7;

vspJump[0] = -7;
vspJump[1] = -5;

vspMax = 20;
vspWJump = -8;
vspMaxWall = 4

jumpCount = 0;
jumpHoldTimer = 0;
jumpHoldFrames[0] = 16;
jumpHoldFrames[1] = 14;

grv[0] = 0.475;		//normal gravitygravity
grv[1] = 0.1;	//slide gravity for jumping off ramps
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

facingRight = 1;

iFrames = 60;

slime = 0;
nearestWeapon = noone
randomWand = false;

bloodMeter = 0;
bloodMax = 300;

inRoom = false

//ui bits
gArr[0] = oInv;
gArr[1] = oHealthBar;
gArr[2] = oAmmoCount;
gArr[3] = oExpBar;
gArr[4] = oMultiWeapon;
gArr[5] = oExclam;
gArr[6] = oShotSniperLaser;
gArr[7] = oMusicManager;

//player States
stateFree = function()
{
	mask_index = sNewt;
	if (jumpCount < jumpMax) and input_check_pressed("jump")
	{
		drawXscale = 0.75;
		drawYscale = 1.5;
	}
	
	rot = -hsp*1.5;
	
	//while standing resets
	with oCamera {curBuff = buff[0]};
	image_angle = 0;	
	
	//init if backwards or not 
	var _backwards = false
	
	//sprint toggle
	if input_check("runtoggle") {global.autoRun = !global.autoRun};
	//sprint
	if (global.autoRun){moveType = 1; image_speed = 10} else {moveType = 0; image_speed = 1};

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
		hsp = clamp(hsp,-hspWalk[moveType],hspWalk[moveType]);
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
		jumpHoldTimer = jumpHoldFrames[jumpCount-1];
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
		
		vsp = vspJump[jumpCount-1];
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
	if (sprite_index = sNewtWalk) and (image_index == 1 or image_index == 4)
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
			if _backwards && (place_meeting(x,y+1,oCollide)) {image_speed = -1} else image_speed = 1; //if walking backwards, play animation backwards
			
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
			if _backwards && (place_meeting(x,y+1,oCollide)) {image_speed = -1} else image_speed = 1; //if walking backwards, play animation backwards
			
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
	} else image_speed = 1;

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
			sprite_index = sNewtAir;
			image_speed = 0;
			image_index = (vsp > 0);			
		}
	}
	else
	{
		if (sprite_index == sNewtAir) 
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
			sprite_index = sNewtWalk;
		}else 
		{
			sprite_index = sNewtIdle;
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
	
	if sprite_index == sNewtIdle and image_index = 21
	{
		squishNewt(1.05,0.95);
	}
	
	//crouching
	if input_check("down") and (onWall == 0) 
	{
		midGrind = 0;
		hsp *= 1.5
		state = stateCrouch;
		squishNewt(1.15,0.85);
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
		jumpHoldTimer = jumpHoldFrames[jumpCount-1];
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
		vsp = vspJump[jumpCount-1];
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
	
}

state = stateFree;

//moving platforms
myPlat = noone;
movePlatXspd = 0;


