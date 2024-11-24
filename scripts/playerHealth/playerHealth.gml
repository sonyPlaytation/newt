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
///@args ally
function playerHit(argument0){

if argument1 == undefined{argument1 = oNewt};

with (argument1)
	if (iFrames <= 0) and instance_exists(oNewt)
	{
		flash = 3;
		if (argument0 == undefined) {argument0 = 1};
		
		if argument1.id == oNewt.id
		{
			oInv.hp = oInv.hp - argument0;
			repeat(5*argument0)
			{
				with instance_create_depth(x,global.newtCenter, depth +10, oBlood)
				{
					fakeBlood = true;	
				}
			}
		
			iFrames = 60;
			if (oInv.hp > 0) {audio_play_sound(snNewtHurt,800,false)};
			blinkExt(image_alpha, "image_alpha", 1, iFrames);
		
			if array_contains(oMultiWeapon.heldweapons,15){oMultiWeapon.ammo[4]+=15}
		}
		else
		{
			hp = hp - argument0;
			iFrames = iFramesReset;
			blinkExt(image_alpha, "image_alpha", 1, iFrames);
		}
	}
}

function allyHit()
{
	if place_meeting(x,y,pEnemy)
	{
		var _enemy = instance_place(x,y,pEnemy);
		if (!_enemy.inactive)
		{
			if (vsp > 0)
			{
				dashCount = min(dashCount+1, 2);
				iFrames = 10;
				if (input_check("jump")) {vsp = -9} else {vsp = -6};	
				with(instance_place(x,y,pEntity))
				{
					diedFrom = "standard"
					hp -= 25 + (vsp*3);
		
					if (!noDMG)
					{
						myDamage.damage += 25;
						myDamage.alpha = 1;
						myDamage.dmgTextScale = 0.75
					}
		
					flash = 3;
					hitfrom = other.direction;
					oSFX.koopastomp = true;
					screenShake(2,15);
				}
	
				repeat(5)
					{
						with (instance_create_layer(x,bbox_bottom, "Player", oSlime))
						{
							vsp = choose(vsp++, vsp--);
							hsp = random_range(0, -5);
							image_speed = slimeDecay;
						}		
					}
				repeat(5)
					{
						with (instance_create_layer(x,bbox_bottom, "Player", oSlime))
						{
							vsp = choose(vsp++, vsp--);
							hsp = random_range(5, 0);
							image_speed = slimeDecay;
						}		
					}
			}
			if _enemy.damage != 0 {playerHit(_enemy.damage,self)};
		}
	}
}