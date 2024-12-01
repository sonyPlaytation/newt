///// @description

//hitTarget = function()
//{
//	//hitting an enemy
//	if (place_meeting(x,y,pEntity))
//	{
//		var hitTargs = ds_list_create();
//		var targNum = collision_ellipse_list(x-100,y-100,x+100,y+100,pEntity,0,0,hitTargs,1);
					
//		if (place_meeting(x,y,pEntity)) and targNum > 0
//		{
//			for (var i=0; i < targNum; i++;)
//			{
//				var target = ds_list_find_value(hitTargs,i);
			
//				with target
//				{
//					diedFrom = "standard";
//					enemyHit(oWeapon.damage);
//				}
//			}
//		} 
//		ds_list_destroy(hitTargs);
//	}
//}

//parry = function()
//{
//	if object_is_ancestor(hitGuy.object_index,pPhysProp)
//	{
//		var hitProps = ds_list_create();
//		var propNum = collision_ellipse_list(x-100,y-100,x+100,y+100,pPhysProp,0,0,hitProps,1);
					
//		if (place_meeting(x,y,pPhysProp)) and propNum > 0
//		{
//			for (var i=0; i < propNum; i++;)
//			{
//				var prop = ds_list_find_value(hitProps,i);
			
//				with prop
//				{
//					idleTimer = 0;
//					phy_active = true;
//					var physX = lengthdir_x(100,oWeapon.image_angle)*(1000-(prop.phy_mass));
//					var physY = lengthdir_y(100,oWeapon.image_angle)*(1000-(prop.phy_mass));
				
//					physics_apply_impulse(x,y,physX,physY);
				
//					diedFrom = "standard";
			
//					flash = 3;			
//					hitfrom = other.direction;	
//				}
//			}
//		} 
//		ds_list_destroy(hitProps);
//	}
//	else
//	{
//		var hitTargs = ds_list_create();
//		var targNum = collision_ellipse_list(x-100,y-100,x+100,y+100,pPhysProp,0,0,hitTargs,1);
					
//		if (place_meeting(x,y,pEntity)) and targNum > 0
//		{
//			for (var i=0; i < targNum; i++;)
//			{
//				var target = ds_list_find_value(hitTargs,i);
			
//				with target
//				{
//					diedFrom = "standard";
//					enemyHit(oWeapon.damage);
//				}
//			}
//		} 
//		ds_list_destroy(hitTargs);
//	}
//	instance_destroy();
//}