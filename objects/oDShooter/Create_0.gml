
vanishFrames = 60;
alarm[0] = vanishFrames; //destroy body after x frames


flash = 3;
inactive = false;
hsp = 0;
vsp = 0;
grv = 0.3;
done = 0;
screenShake(3,15);
image_speed = 0;
size = global.getSizeKilled;

multiplier = choose(1,1,1,1,2);

expGive();
charred = false;


if (oInv.hpMissing != 0)
{
	if (irandom_range(1,100) <= dropRate)
	{
		if !array_contains(oMultiWeapon.heldweapons, 1)
		{
			mydrop = instance_create_layer(x,y-15,"Player",oWeaponPickup)
			with mydrop
			{
				image_index = 1;
				weapon = 1;
				randomWand = false;
			}
		} else with instance_create_layer(x,y-2,layer,oPistAmmoPickup)	{vsp = -5};
	}
}
else mydrop = noone;
