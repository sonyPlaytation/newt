///@args hpPlus
///@args destroy

function playerHeal(argument0,argument1){

if (oInv.hpMax > oInv.hp)
	{			
		if (oInv.hp + argument0 > oInv.hpMax)
			{
				oInv.hp = oInv.hpMax;
			}
			else
			{
				oInv.hp += argument0;
			}

		oSFX.healsound = true;
		if (argument1 = true) {instance_destroy(other)};
	}

}

///@args healAlso
function playerHealthUp(argument0){

if (oInv.hpMax < 12)
	{			
		oInv.hpMax += 1;
		
		if (argument0 == true) and (oInv.hp < oInv.hpMax)
		{
			oInv.hp +=1
		}
		
		oSFX.healsound = true;
		instance_destroy(other);
	}

}

///@args damage
function playerHit(argument0){

with (oNewt)
	if (iFrames == 0)
	{
		flash = 3;
		if (argument0 == undefined) {argument0 = 1};
		oInv.hp = oInv.hp - argument0;
		iFrames = 60;
	
		if (oInv.hp > 0) {audio_play_sound(snNewtHurt,800,false)};
	
		blinkExt(image_alpha, "image_alpha", 1, iFrames);
		
		if array_contains(oMultiWeapon.heldweapons,15){oMultiWeapon.ammo[4]+=15}

	}


}