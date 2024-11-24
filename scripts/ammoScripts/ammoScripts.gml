function getAmmo()
{
	var randType = irandom(5);
	with(oWeapon)
	{
		if (ammo[ammotype] < ammoMax[ammotype]) and (ammouse > -1)
		{
			ammo[ammotype] += ceil(ammoMax[ammotype]/3);
			if ammo[ammotype] > ammoMax[ammotype]{ammo[ammotype] = ammoMax[ammotype]}
		}else ammo[randType] += ceil(ammoMax[randType]/3);
	}
}