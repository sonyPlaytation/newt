/// @description Insert description here
// You can write your code in this editor

if !place_meeting(x,y,pPhysProp)
{
	if phy_speed < 2 and idleTimer < 120 {idleTimer++} else idleTimer = 0;
	if idleTimer >= 120 {phy_active = false;}
	
	if captured {phy_active = false; idleTimer = 0} //else phy_active = true;
}
else if screenPause(){phy_active = false} else phy_active = true;

var _fDense = median(bbox_top-bbox_bottom,bbox_right-bbox_left);

//hitting an enemy
if (place_meeting(x,y,pEntity)) and phy_speed > 5 and !captured
{
	var target = instance_place(x,y,pEntity)
	if !target.inactive
	{
		with(target)
		{
			diedFrom = "standard";
			
			var _dmg = ceil(other.damage * (other.phy_speed/4)*(_fDense/24));
			var _finaldmg = max(_dmg,15);
			hp -= _finaldmg
			
			if (!noDMG)
			{
				myDamage.damage += _finaldmg;
				myDamage.alpha = 1;
				myDamage.dmgTextScale = 0.75
			}
			
			global.critTotalDMG += _finaldmg
			
			flash = 3;			
			hitfrom = other.direction;
		}
		hp -= ceil(other.damage * (other.phy_speed/4)*(_fDense/24))/3;
		if fragile {hp = 0};
	
		if !object_is_ancestor(target.object_index,pPhysProp)
		{
			var physX = lengthdir_x(999,point_direction(target.x,target.y,x,y));
			var physY = lengthdir_y(999,point_direction(target.x,target.y,x,y))
			physics_apply_impulse(x,y,physX,physY);
		}
	}
}

