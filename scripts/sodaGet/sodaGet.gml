
function sodaGet(soda)
{
	oAmmoCount.sodaPush = soda;
	switch (soda)
	{
		case 0: //double jumps
			global.soda[0] = true;
			with(oGame){extraJumps++};
		break;
		
		case 1: //homing
			global.soda[1] = true;
		break;
		
		case 2: //blood
			global.soda[2] = true;
		break;
		
		case 3: //two health ups
			global.soda[3] = true;
			playerHealthUp(true);
			playerHealthUp(true);
		break;
		
		case 4: //two health ups
			global.soda[4] = true;
			var AmmoUp = irandom(5);
			oMultiWeapon.ammoMax[AmmoUp]= floor(oMultiWeapon.ammoMax[AmmoUp]*1.5);
		break;
		
		case 5: //two health ups
			global.soda[5] = true;
		break;
	}
}