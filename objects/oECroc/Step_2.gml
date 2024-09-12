

//if (hp <= 0)
//{
//	if (irandom_range(1,100) <= dropRate)
//	{
//		if !array_contains(oMultiWeapon.heldweapons, 5)
//		{
//			mydrop = instance_create_layer(x,y-15,"Player",oWeaponPickup)
//			with mydrop
//			{
//				sprite_index = sWeapList;
//				weapon = irandom_range(1, global.weaplistsize);
//				image_index = weapon;
//			}
//		} else with instance_create_layer(x,y-2,layer,oPistAmmoPickup)	{vsp = -5};
//	}
//	else mydrop = noone;

//	with (mygun) instance_destroy();
//	if (instance_exists(oNewt))
//	{
//		global.kills++;
//		global.killsthisroom++;
//		oGame.killtextscale = 1.5;
		
//		oGame.killscombo++;
//		oGame.combotimer = oGame.comboreset;
//	}
//	instance_destroy();
//}