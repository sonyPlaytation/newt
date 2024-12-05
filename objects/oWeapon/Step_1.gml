
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
	
	#region DEBUG
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
	#endregion

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
	
		dist =	point_distance(100,100,oWeapon.x,oWeapon.y);
	
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
		dist =	point_distance(mouse_x,mouse_y,oWeapon.x,oWeapon.y);
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
		#region weapon swapping
		
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
		#endregion

		if oNewt.prop == noone
		{
			switch (type)
			{
	
				case 0: //primary
					fireWeapon();
				break;

				case 1: //secondary
					fireWeapon();
				break;

				case 2: //melee
					swingMelee();
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
					_prop.phy_active = true;
					oNewt.prop = noone;
					
					var _physX = lengthdir_x(4 + abs(oNewt.hsp), other.image_angle) * 1000
					var _physY = lengthdir_y(4 + abs(oNewt.vsp), other.image_angle) * 1000
									
					physics_apply_impulse(x,y,_physX-phy_mass,_physY);
				}
				
				if input_check_pressed("interact")
				{
					oNewt.propBuffer = 15;
					_prop.captured = false;
					_prop.phy_active = true;
					oNewt.prop = noone;
				}
			}
		}
		

		#region edge case weapon specific shit

		//chainsaw
		if (sprite == sChainsaw) and ammo[ammotype] > 0
		{
			if input_check("shoot"){oSFX.chainsawLoop = 1;}
			else {oSFX.chainsawLoop = 0;} ;
		}else oSFX.chainsawLoop = noone;
	
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