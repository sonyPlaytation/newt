/// @description Insert description here
// You can write your code in this editor

if screenPause() or captured {phy_active = false}else phy_active = true;

//hitting an enemy
if (place_meeting(x,y,pEntity)) and phy_speed > 3 and !captured
{
	var target = instance_place(x,y,pEntity)
	with(target)
	{
		diedFrom = "standard";
			
		var _dmg = ceil(other.damage * other.phy_speed);
		var _finaldmg = _dmg;
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
	
	var physX = lengthdir_x(999,point_direction(target.x,target.y,x,y));
	var physY = lengthdir_y(999,point_direction(target.x,target.y,x,y))
	physics_apply_impulse(x,y,physX,physY);
}