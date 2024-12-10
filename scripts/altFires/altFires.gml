///@args altfire
function altFires(altfire){

if  oNewt.hasControl and altfire != -1 and input_check_pressed("altfire") and (delayRight < 0)
{
	switch (altfire)
	{
		//alt fire baseball
		case "baseball":
			if !instance_exists(oBaseball)
			{
				delayRight = 15;
				(instance_create_layer(x + lengthdir_x(25,image_angle),y + lengthdir_y(50,image_angle),"Shots",oBaseball))
			}
		break;
			
		//alt fire for wrench
		case "sentry":
			if !instance_exists(oSentryToolbox) and !instance_exists(oSentry) 
			{
				if ammo[0] >= 100
				{
					with instance_create_depth(x,y,depth-10,oSentryToolbox)
					{
						hsp = lengthdir_x(8,oWeapon.image_angle)
						vsp = lengthdir_y(8,oWeapon.image_angle)
						image_xscale = oNewt.facingRight;
							
						x = oNewt.x;
						y = oNewt.y-10;
					}
					ammo[0]-=100;
				}
			}
			else
			{
				with (instance_create_layer(x,y,"Shots",oShotMelee))
				{								
					image_xscale = oWeapon.length+point_distance(x,y,oNewt.x,global.newtCenter);
					direction = oWeapon.image_angle;
					speed = 0;
					image_angle = direction;
					click = 1;
				}
			}
		break;
			
		//alt fire for wrench
		case "meleeSlice":
			with (instance_create_layer(x,y,"Shots",oShotMelee))
			{								
				image_xscale = oWeapon.length+point_distance(x,y,oNewt.x,global.newtCenter);
				direction = oWeapon.image_angle;
				speed = 0;
				image_angle = direction;
				state = stateSlice;
				click = 0;
				crit = false;
			}
			delayRight = 15;
				
		break;
			
		//alt fire baseball
		case "markscoin":
			if oWeapon.coinCount != 0
			{
				delayRight = 5;
				with (instance_create_layer(x+lengthdir_x(oWeapon.length,oWeapon.image_angle),(y+lengthdir_y(oWeapon.length,oWeapon.image_angle)),"Shots",oMarksCoin))
				{
					dir = oWeapon.image_angle;	
						
					hsp = lengthdir_x(spd, dir);
					vsp = lengthdir_y(spd, dir);
				}
			}
		break;
			
		//alt fire grenade
		case "contactGrenade":
			if ammo[3] >= 10
			{
				ammo[3] -= 10;
				delayRight = 60;
				with (instance_create_layer(x+lengthdir_x(oWeapon.length,image_angle),(y+lengthdir_y(oWeapon.length,image_angle)),"Shots",oContactGrenade))
				{
					audio_play_sound(snShotHLGren,999,false)
					dir = other.image_angle;
					image_angle = dir;
				}
			}
		break;
			
		// hand grenade
		case "handgrenade":
			if oNewt.prop == noone
			{
				delayRight = 60;
				var gren = (instance_create_layer(x,y,"Player",oGrenade))
				with gren
				{
					captured = true;
					phy_active = false;
					audio_play_sound(snHL1Pickup,999,false);
				}
				oNewt.prop = gren;
			}
		break;
			
		//feedbacker
		case "guitarparry":	
			oSFX.wooshBasic = true;
				
			delayRight = 50;
			current_cd = 35;
			image_index = 0;
			image_speed = 1;
			sprite_index = animM2;
				
			with (instance_create_layer(x,y,"Shots",oShotMelee))
			{
				crit = false;
				image_xscale = 30;
				direction = other.image_angle
				image_angle = direction;
			}
				
			with(oNewt)
			{
				hsp -= lengthdir_x(-5,other.image_angle);
				vsp -= lengthdir_y(-5,other.image_angle);
			}
		break;
			
		//feedbacker
		case "arnoldflip":	
			if oWeapon.ammo[1] > 0
			{
				current_cd = 5;
				oSFX.wooshBasic = true;
				
				delayRight = 50;
				current_cd = 35;
				image_index = 0;
				image_speed = 1;
				sprite_index = animM2;
				
				oWeapon.ammo[1]--;
				with (instance_create_layer(x,y,"Player",oCasing))
				{
					image_index = other.casing;
					hsp = lengthdir_x(3, other.image_angle-180 + random_range(-10, 10));
					vsp =  random_range(-7, -5);
					if (sign(hsp)!=0) image_xscale = sign(hsp); 	
				}
				
				audio_play_sound(snCockTF2SG,800,false);
				with (instance_create_layer(x,y,"Shots",oShotMelee))
				{
					crit = false;
					image_xscale = 30;
					direction = other.image_angle
					image_angle = direction;
				}
				
				with(oNewt)
				{
					hsp -= lengthdir_x(-5,other.image_angle);
					vsp -= lengthdir_y(-5,other.image_angle);
				}
			}
		break;
			
		//laser sight
		case "scope":
			if instance_exists(oShotSniperLaser) 
			{
				showLaser = !showLaser;
			};
		break;
			
		//alt fire grenade
		case "fireball":
			
			if ammo[4] >= 8
			{
				ammo[4] -= 8;
				delayRight = 60;
				with (instance_create_layer(x+lengthdir_x(oWeapon.length,image_angle),(y+lengthdir_y(oWeapon.length,image_angle)),"Shots",oShotFireball))
				{
					audio_play_sound(snFireballCast,999,false)
					
					dir = other.image_angle;
					image_angle = dir;
				}
			}
		break;
		}
	}
}