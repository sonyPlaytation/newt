
function sodaGet(soda)
{
	//oGame
	oAmmoCount.sodaPush = soda;
	switch (soda)
	{
		case 0: //double jumps
		
			global.soda[0] = true;
			oInv.extraJumps++;
		break;
		
		case 1: //homing
			global.soda[1] = true;
		break;
		
		case 2: //blood
			global.soda[2] = true;
			playerHealthUp(false);
		break;
		
		case 3: //two health ups
			global.soda[3] = true;
			playerHealthUp(true);
			playerHealthUp(true);
			playerHealthUp(true);
		break;
		
		case 4: //ammo max increase
			global.soda[4] = true;
			var AmmoUp = irandom(5);
			oWeapon.ammoMax[AmmoUp]= floor(oWeapon.ammoMax[AmmoUp]*1.5);
		break;
		
		case 5: //air dashes
			global.soda[5] = true;
		break;
		
		case 6: //damage up
			global.soda[6] = true;
			oInv.dmgMod += 0.15;
		break;
	}
}