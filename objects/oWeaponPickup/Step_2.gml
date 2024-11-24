/// @description Insert description here
// You can write your code in this editor

switchTimer--;

if collision_line(x,y,x,y-45,oCollide,0,0){y++}

//float anim
y = ystart+sin(get_timer()/500000) *5;

image_angle = sin(get_timer()/100000) *5;

if randomWand
{
	if switchTimer < 0
	{
		image_index++;
		switchTimer = switchReset;
	}
	
}else image_index = weapon;

if instance_exists(oNewt) and point_distance(x,y,oNewt.x,oNewt.y) > 48{active = false}

//equip wand
if (instance_exists(oNewt)) and active
{
	if !instance_exists(myInfo)
	{
		myInfo = instance_create_depth(x,y,depth-1,oInfoText);
		with myInfo
		{
			active = 1;
			owner = other.id
			weapon = other.weapon;	
		}	
	}
	
	oExclam.image_index = 3;
	//oNewt.exclam = true;
	
	if input_check_pressed("interact")
	{
		oWeapon.showLaser = false;
		oNewt.squishNewt(1.15,0.85);
		//if no gun in hand
		if oWeapon.heldweapons[type] == 0
		{
			oGame.combotimer += 80;
			with (oWeapon)
			{
				weaponStats(other.weapon);
				sprite_index = sprite;
				i = type; 
				if (pickupsound != -1){oSFX.newweapon = true};
			
				if !global.hasweapon
				{
					ammo[ammotype] = ammoMax[ammotype]
					global.hasweapon = true;
				}
			
				heldweapons[type] = other.weapon;

				if other.newAmmo {getAmmo(ammotype)};		
			
				if type == 0 {oAmmoCount.weap[0] = other.weapon};
				if type == 1 {oAmmoCount.weap[1] = other.weapon};
				if type == 2 {oAmmoCount.weap[2] = other.weapon};

			}
			oNewt.exclam = false;
			instance_destroy();
		}
		else
		{
			randomWand = false;
			var _newWeap = oWeapon.heldweapons[other.type];
			
			with (oWeapon)
			{
				weaponStats(other.weapon);
				sprite_index = sprite;
				i = type; 
				if (pickupsound != -1){oSFX.newweapon = true};
			
				heldweapons[type] = other.weapon;

				if other.newAmmo {getAmmo(ammotype)};	
			
				if type == 0 {oAmmoCount.weap[0] = other.weapon};
				if type == 1 {oAmmoCount.weap[1] = other.weapon};
				if type == 2 {oAmmoCount.weap[2] = other.weapon};

			}
			newAmmo = false;
			weapon = _newWeap;
			if instance_exists(myInfo){myInfo.weapon = weapon;}
		}
	} 
}else if instance_exists(myInfo){myInfo.active = false;}