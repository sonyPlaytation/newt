
if (!other.inactive)
{
	if (vsp > 0)
	{
		dashCount = min(dashCount+1, 2);
		iFrames = 10;
		if (keyboard_check(vk_space)) {vsp = -9} else {vsp = -6};	
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

	if other.damage != 0 {playerHit(other.damage)};

}