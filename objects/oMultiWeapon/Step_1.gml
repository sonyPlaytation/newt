
if screenPause() {exit;}
if instance_exists(oNewt) and !oNewt.hasControl {image_speed = 0; exit;}else{image_speed = 1};

input_axis_threshold_set(gp_axisrh,0.08,0.95);
input_axis_threshold_set(gp_axisrv,0.08,0.95);
//Right stick Axes

if instance_exists(oNewt)
{
	depth = oNewt.depth-10
	global.gunX = x+lengthdir_x(length,image_angle);
	global.gunY = y+lengthdir_y(length,image_angle);

	crit = false;
	delayRight--;

	if ammo[ammotype] > ammoMax[ammotype]{ammo[ammotype] = ammoMax[ammotype]};
	
	//DEBUG
	if keyboard_check_pressed(vk_right)
	{
		if k+1 < array_length(weapons){k++};
		weaponStats(k);
		ammo[ammotype] = ammoMax[ammotype];
		sprite_index = sprite;
		heldweapons[i] = k;
		oAmmoCount.weap[i] = k;
	}
	
	if keyboard_check_pressed(vk_left)
	{
		if k != 0 {k--};
		weaponStats(k);
		ammo[ammotype] = ammoMax[ammotype];
		sprite_index = sprite;
		heldweapons[i] = k;
		oAmmoCount.weap[i] = k;
	}
	
	if keyboard_check_pressed(vk_down)
	{
		k = 0;
		weaponStats(k);
		ammo[ammotype] = ammoMax[ammotype];
		sprite_index = sprite;
		heldweapons[i] = k;
		oAmmoCount.weap[i] = k;
	}
	
	if keyboard_check_pressed(vk_up)
	{
		k = array_length(weapons)-1;
		weaponStats(k);
		ammo[ammotype] = ammoMax[ammotype];
		sprite_index = sprite;
		heldweapons[i] = k;
		oAmmoCount.weap[i] = k;
	}

	if input_check_pressed("weapon1")
	{
		if heldweapons[0] != 0
		{
			i=0;
			weaponStats(heldweapons[0]); 
			oSFX.weaponswitchsound = true;
			if pickupsound != -1 {oSFX.newweapon = true};
			sprite_index = sprite;
		}
	}

	if input_check_pressed("weapon2")
	{
		if heldweapons[1] != 0
		{
			i=1;
			weaponStats(heldweapons[1]); 
			oSFX.weaponswitchsound = true;
			if pickupsound != -1 {oSFX.newweapon = true};
			sprite_index = sprite;
		}
	}

	if input_check_pressed("weapon3")
	{
		if heldweapons[2] != 0
		{
			i=2;
			weaponStats(heldweapons[2]); 
			oSFX.weaponswitchsound = true;
			if pickupsound != -1 {oSFX.newweapon = true};
			sprite_index = sprite;
		}
	}

	if heldweapons[type] !=0 and keyboard_check_pressed(vk_backspace)
	{
		with instance_create_depth(x,y,oNewt.depth+100,oWeaponPickup)
		{
			weapon = other.heldweapons[other.type];
			newAmmo = false;
			randomWand = false;
		}
		
		k = 0;
		weaponStats(k);
		ammo[ammotype] = ammoMax[ammotype];
		sprite_index = sprite;
		heldweapons[i] = k;
		oAmmoCount.weap[i] = k;
		sprite_index = sprite;
	}
	
	x = oNewt.x;
	y = global.newtCenter;
	
	if input_gamepad_is_any_connected() and global.inputdevice = "gamepad"
	{
		if !instance_exists(oCursor) and global.inputdevice != "keyboard_and_mouse"
		{
			with (instance_create_layer(x,y,"player",oCursor))	
			{
				owner = other.id;	
				depth = -9999;
			}
		}
	
		dist =	point_distance(100,100,oMultiWeapon.x,oMultiWeapon.y);
	
		var xAim = input_value("aim_right") - input_value("aim_left")
		var yAim = input_value("aim_down") - input_value("aim_up")
	
		if xAim !=0 or yAim !=0
		{
			var aimDir = point_direction(0,0,xAim,yAim);
			image_angle = aimDir;
		}
	
	}
	else
	{
		dist =	point_distance(mouse_x,mouse_y,oMultiWeapon.x,oMultiWeapon.y);
		image_angle = point_direction(x,y,oCrosshairXY.x,oCrosshairXY.y);
	
		x = x + lengthdir_x(clamp(dist,0,dist/25),image_angle);
		y = y + lengthdir_y(clamp(dist,0,dist/25),image_angle);	
	}



	current_delay = max(-1,current_delay-1);
	if (current_delay == -1) {current_cd = max(0, current_cd-1)};
	current_recoil = max(0,current_recoil*0.8);

	if (image_angle > 90) and (image_angle < 270) {image_yscale = -1} else image_yscale = 1;

	if oNewt.hasControl
	{
	
	
		//scroll up weapon select
		if input_check_pressed("nextweap")	
		{
			showLaser = 0;
			if i+1 < 3
			{
				oSFX.weaponswitchsound = true;
				weaponStats(array_get(heldweapons, i+1)); 
				i+=1;
				if pickupsound != -1 {oSFX.newweapon = true};
				sprite_index = sprite;
			}
			else
			{
				oSFX.weaponswitchsound = true;
				weaponStats(array_get(heldweapons, 0)); 
				i=0;
				if pickupsound != -1 {oSFX.newweapon = true};
				sprite_index = sprite;
			
			}
		}

		//scroll down weapon select
		if input_check_pressed("prevweap")	
		{
			showLaser = 0;
			if (i-1 !=-1)
			{
				oSFX.weaponswitchsound = true;
				weaponStats(array_get(heldweapons, i-1)); 
				i-=1;
				if pickupsound != -1 {oSFX.newweapon = true};
				sprite_index = sprite;
			}
			else
			{
				oSFX.weaponswitchsound = true;
				weaponStats(array_get(heldweapons, 2)); 
				i=2;
				if pickupsound != -1 {oSFX.newweapon = true};
				sprite_index = sprite;
			}
		}
	
		var mouseLeft;			
		if (automatic) mouseLeft = input_check("shoot"); else mouseLeft = input_check_pressed("shoot");

		if oNewt.prop == noone
		{
			switch (type)
			{
	
				case 0: //primary
					#region
				
					if (mouseLeft)
					{
						if (current_cd == 0)
						{
							current_cd = cooldown;
							current_delay = startup;	
							image_index = 0;
						}
						image_speed = 1;
					}

					var _spread = spread;
					var _spreadDiv = _spread / max( bulletnumber - 1, 1 );
			
					#region left click
					if oNewt.hasControl && (current_delay == 0) && (projectile != -1)
					{
	
						if (ammo[ammotype] >= ammouse) and (bulletnumber != -1)
						{	
							if (shootsfx != -1)	
							{
								soundNicer();
							}
					
							oNewt.lit = 3;
							ammo[ammotype] -= ammouse;
		
							for (var j = 0; j < bulletnumber; j++)
							{
								shotNumber++;
								screenShake(shakeamnt,shaketime);	
							
								with (instance_create_layer(x+lengthdir_x(length,image_angle),(y+lengthdir_y(length,image_angle)),"Shots",projectile))
								{
									if (other.cancrit == 1) and global.hasCrit or global.critTimer > 0
									{
										oSFX.critshot = true;
										crit = global.hasCrit;
							
									}else crit = false;
									global.hasCrit = false;
							
									if other.headshots{headshot = true};
							
									shotNumber = other.shotNumber;
									hitSprite = other.hitSprite;
									dir = other.image_angle- _spread/2 + _spreadDiv * j + random_range(-other.accuracy,other.accuracy);
									spd = other.bulletspeed;
									image_angle = dir;
								
									if other.projectile == oPropTestBall
									{
										var _physX = lengthdir_x(other.bulletspeed, other.image_angle) * 10000
										var _physY = lengthdir_y(other.bulletspeed, other.image_angle) * 10000
									
										physics_apply_impulse(x,y,_physX,_physY);
									}
									else
									{
										image_xscale = max(1,spd/sprite_width);
									}
								
								}

								with(oNewt)
								{
									if (oNewt.state != stateCrouch)
									{	
										hsp -= lengthdir_x(other.recoilpush,other.image_angle);
										vsp -= lengthdir_y(other.recoilpush,other.image_angle);
									}
								}						
							}
							shotNumber = 0;
		
							if casing != -1
							{
								with (instance_create_layer(x,y,"Player",oCasing))
								{
									image_index = other.casing;
									hsp = lengthdir_x(3, other.image_angle-180 + random_range(-10, 10));
									vsp =  random_range(-7, -5);
									if (sign(hsp)!=0) image_xscale = sign(hsp); 	
								}
							}
					}
					current_recoil = recoil;
					if (ammo[ammotype] < ammouse) and mouseLeft {audio_play_sound(snNoAmmo,300,false)};
				}
				#endregion

				//right click
				altFires(altfire);
		
				var _dir = image_angle;

				x = x - lengthdir_x(min(current_recoil,4), _dir);
				y = y - lengthdir_y(min(current_recoil,4), _dir);
				#endregion
			break;

			case 1: //secondary
				#region
				
				if (mouseLeft)
				{
					if (current_cd == 0)
					{
						current_cd = cooldown;
						current_delay = startup;
					}
				}

				var _spread = spread;
				var _spreadDiv = _spread / max( bulletnumber - 1, 1 );

				#region left click
				if oNewt.hasControl && (current_delay == 0) && (projectile != -1)
				{
	
					if (ammo[ammotype] >= ammouse) and (bulletnumber != -1)
					{	
						if (shootsfx != -1){soundNicer()};	
						oNewt.lit = 3;
						ammo[ammotype] -= ammouse;
		
						for (var j = 0; j < bulletnumber; j++)
						{
							shotNumber++;
							screenShake(shakeamnt,shaketime);	
							with (instance_create_layer(x+lengthdir_x(length,image_angle),(y+lengthdir_y(length,image_angle)),"Shots",projectile))
							{
								if (other.cancrit == 1) and global.hasCrit or global.critTimer > 0
								{
									oSFX.critshot = true;
									crit = global.hasCrit;
							
								}else crit = false;
								global.hasCrit = false;
							
								if other.headshots{headshot = true};
							
								shotNumber = other.shotNumber;
								hitSprite = other.hitSprite;
								dir = other.image_angle- _spread/2 + _spreadDiv * j + random_range(-other.accuracy,other.accuracy);
								spd = other.bulletspeed;
								image_angle = dir;
								image_xscale = max(1,spd/sprite_width);
							}

							with(oNewt)
							{
								if (oNewt.state != stateCrouch)
								{	
									hsp -= lengthdir_x(other.recoilpush,other.image_angle);
									vsp -= lengthdir_y(other.recoilpush,other.image_angle);
								}
							}
						}
						shotNumber = 0;
						if casing != -1
						{
							with (instance_create_layer(x,y,"Shots",oCasing))
							{
								image_index = other.casing;
								hsp = lengthdir_x(3, other.image_angle-180 + random_range(-10, 10));
								vsp =  random_range(-7, -5);
								if (sign(hsp)!=0) image_xscale = sign(hsp); 	
							}
						}
					}
					current_recoil = recoil;
					if (ammo[ammotype] < ammouse) and mouseLeft {audio_play_sound(snNoAmmo,300,false)};
				}
				#endregion

				//right click
				altFires(altfire);

				var _dir = image_angle;

				x = x - lengthdir_x(min(current_recoil,4), _dir);
				y = y - lengthdir_y(min(current_recoil,4), _dir);
				#endregion
			break;

			case 2: //melee
				#region

				if (mouseLeft)
				{
					if (current_cd == 0)
					{
						current_cd = cooldown;
						current_delay = startup;	
						
						image_index = 0;
						sprite_index = animM1;
						image_speed = 1;
					}	
				}

				var _spread = spread;
				var _spreadDiv = _spread / max( bulletnumber - 1, 1 );

				#region left click
				if oNewt.hasControl && (current_delay == 0) && (projectile != -1)
				{	
					if (ammo[ammotype] >= ammouse) and (bulletnumber != -1)
					{	
						if (shootsfx != -1)	
						{
							soundNicer();
						}
						if ammouse >= 0 {ammo[ammotype] -= ammouse};
		
						for (var j = 0; j < bulletnumber; j++)
						{
						
							screenShake(shakeamnt,shaketime);	
							with (instance_create_layer(x,y,"Shots",projectile))
							{
								if (other.cancrit == 1) and global.hasCrit or global.critTimer > 0
								{
									oSFX.critshot = true;
									crit = global.hasCrit;
							
								}else crit = false;
								global.hasCrit = false;
									
								click = 0;
								image_xscale = other.length+point_distance(x,y,oNewt.x,global.newtCenter);
								direction = other.image_angle- _spread/2 + _spreadDiv * j + random_range(-other.accuracy,other.accuracy);
								speed = other.bulletspeed;
								image_angle = direction;
							}

							with(oNewt)
							{
								hsp -= lengthdir_x(other.recoilpush,other.image_angle);
								vsp -= lengthdir_y(other.recoilpush,other.image_angle);
							}
						}
							
						if casing == oSmoke{instance_create_layer(x,y,"Player",oSmoke)}					
						else if casing != -1
						{
							with (instance_create_layer(x,y,"Player",oCasing))
							{
								image_index = other.casing;
								hsp = lengthdir_x(3, other.image_angle-180 + random_range(-10, 10));
								vsp =  random_range(-7, -5);
								if (sign(hsp)!=0) image_xscale = sign(hsp); 	
							}
						}
					}
					current_recoil = recoil;
					if (ammo[ammotype] < ammouse) and mouseLeft {audio_play_sound(snNoAmmo,300,false)};
				}
				#endregion

				//right click
				altFires(altfire);

				var _dir = image_angle;

				x = x - lengthdir_x(min(current_recoil,4), _dir);
				y = y - lengthdir_y(min(current_recoil,4), _dir);
				#endregion
				break;
			}
		}
		else
		{
			var _prop = oNewt.prop
			with _prop
			{
				phy_position_x = oNewt.x + lengthdir_x(36, other.image_angle);
				phy_position_y = global.newtCenter + lengthdir_y(36, other.image_angle);
				
				if input_check_pressed("shoot") and !place_meeting(_prop.x,_prop.y, oCollide)
				{
					oNewt.propBuffer = 15;
					_prop.captured = false;
					_prop.phy_rotation = 0;
					oNewt.prop = noone;
					
					var _physX = lengthdir_x(2 + abs(oNewt.hsp), other.image_angle) * 10000
					var _physY = lengthdir_y(2 + abs(oNewt.vsp), other.image_angle) * 10000
									
					physics_apply_impulse(x,y,_physX-phy_mass,_physY);
				}
				
				if input_check_pressed("interact")
				{
					oNewt.propBuffer = 15;
					_prop.captured = false;
					_prop.phy_rotation = 0;
					oNewt.prop = noone;
				}
			}
		}
		

		#region edge case weapon specific shit

		//chainsaw
		if (sprite == sChainsaw)
		{
			if (image_index >= 0) and mouseLeft{oSFX.chainsawLoop = true; oSFX.chainsawIdle = false}else {oSFX.chainsawLoop = false; oSFX.chainsawIdle = true} ;
		}
	
		//marksman
		if (sprite == sMarksman)
		{
			drawSetText(c_white,fSign,fa_center,fa_bottom)
			draw_text_transformed(oNewt.x,oNewt.y-45,coinCount,3,3,0);
			if !instance_exists(oMarksCoin){coinCount = 4;}
		}

		#endregion
	}
}