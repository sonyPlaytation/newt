// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function hitTarget()
{
	//hitting an enemy
	if (place_meeting(x,y,pEntity))
	{
		var hitTargs = ds_list_create();
		var targNum = instance_place_list(x,y,pEntity,hitTargs,1);
					
		if targNum > 0
		{
			for (var i=0; i < targNum; i++;)
			{
				var target = ds_list_find_value(hitTargs,i);
			
				if !target.inactive
				{
					with target
					{
						diedFrom = "standard";
						enemyHit(oWeapon.damage);
					}
				}
			}
		} 
		ds_list_destroy(hitTargs);
	}
	instance_destroy();
}

function parry()
{
	if (place_meeting(x,y,pEntity))
	{
		var hitTargs = ds_list_create();
		var targNum = instance_place_list(x,y,pEntity,hitTargs,1);
					
		if targNum > 0
		{
			for (var i=0; i < targNum; i++;)
			{
				var target = ds_list_find_value(hitTargs,i);
			
				if object_is_ancestor(target.object_index,pPhysProp)
				{
					with target
					{
						idleTimer = 0;
						phy_active = true;
						var physX = lengthdir_x(100,oWeapon.image_angle)*(1000-(self.phy_mass));
						var physY = lengthdir_y(100,oWeapon.image_angle)*(1000-(self.phy_mass));
				
						physics_apply_impulse(x,y,physX,physY);
				
						diedFrom = "standard";
			
						flash = 3;			
						hitfrom = other.direction;	
					}
				}
				else
				{
					with target
					{
						diedFrom = "standard";
						enemyHit(oWeapon.damage);
					}
				}
			}
		} 
		ds_list_destroy(hitTargs);
	}
	instance_destroy();
}

function comboReset(_sprite)
{
	if sprite_index != _sprite
	{
		
		image_index = 0;
		sprite_index = _sprite;
		image_speed = 1;
		//if combo == 0
		//{
		//	current_cd = cooldown;
		//	current_delay = startup;
		//}
	}
}

function meleeCombos(_sprite, _click, _frame = 20)
{
	var _startup = oWeapon.startup
	switch _sprite
	{
		case sBusterIdle:
			comboReset(sBusterSwing);
		break;
		
		case sBusterSwing:
			if combo != 0 
			{
				oWeapon.startup = 15;
				comboReset(sBusterCombo);
				fireWeapon();
				combo = 0;
				oNewt.propBuffer = 50;
			}
		break;
		
		case sBusterCombo:
			if combo != 0
			{
				oWeapon.startup = 20;
				comboReset(sBusterSwing);
				fireWeapon();
				combo = 0;
				oNewt.propBuffer = image_number * 1.15;
			}
		break;	
	}
	oWeapon.startup = _startup;
}

function busterCombo(_sprite, _click, _frame = 20)
{
	
}

