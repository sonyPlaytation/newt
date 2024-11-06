///@args altfire
function altFires(altfire){

if  oNewt.hasControl and altfire != -1 and input_check_pressed("altfire") and (delayRight < 0)
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
							hsp = lengthdir_x(8,oMultiWeapon.image_angle)
							vsp = lengthdir_y(8,oMultiWeapon.image_angle)
							image_xscale = oNewt.facingRight;
							
							x = oNewt.x;
							y = oNewt.y-36;
						}
						ammo[0]-=100;
					}
				}
				else
				{
					with (instance_create_layer(x,y,"Shots",oShotMelee))
					{								
						image_xscale = oMultiWeapon.length+point_distance(x,y,oNewt.x,global.newtCenter);
						direction = oMultiWeapon.image_angle;
						speed = 0;
						image_angle = direction;
						click = 1;
					}
				}
			break;
			
			//alt fire baseball
			case "markscoin":
				if oMultiWeapon.coinCount != 0
				{
					delayRight = 5;
					with (instance_create_layer(x+lengthdir_x(oMultiWeapon.length,oMultiWeapon.image_angle),(y+lengthdir_y(oMultiWeapon.length,oMultiWeapon.image_angle)),"Shots",oMarksCoin))
					{
						dir = oMultiWeapon.image_angle;	
						
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
					with (instance_create_layer(x+lengthdir_x(oMultiWeapon.length,image_angle),(y+lengthdir_y(oMultiWeapon.length,image_angle)),"Shots",oContactGrenade))
					{
						audio_play_sound(snShotHLGren,999,false)
					
						dir = other.image_angle;
						image_angle = dir;
					}
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
					with (instance_create_layer(x+lengthdir_x(oMultiWeapon.length,image_angle),(y+lengthdir_y(oMultiWeapon.length,image_angle)),"Shots",oShotFireball))
					{
						audio_play_sound(snFireballCast,999,false)
					
						dir = other.image_angle;
						image_angle = dir;
					}
				}
			break;
			
			
	}
}