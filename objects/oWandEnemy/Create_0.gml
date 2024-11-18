
inSight = 0;
recoil = 0;
countdownRate = 105;
countdown = countdownRate;
focus = 100;
cdr = countdownRate;
viewRange = 350;//how far enemies can see
setspeed = 20;

damage = 0;
target = noone;
friendly = -1;

burstReset = 16;
burstRate = burstReset; //frames between burst fire bullets
shotsFired = 0;

bulletnumber = 1;
spread = 0;
accuracy = 3;
sprite = sWandNull;

statePistol = function()
{
	sprite = s1911;
	if(countdown <= 0)
	{
		countdown = countdownRate;
		recoil = 16;
		screenShake(2,5);
	
		with (instance_create_layer(x,y,"Shots",oEnemyShot))
		{
			damage = other.damage;
			oSFX.enemyShot = snShotHLPist;
			spd = other.setspeed;
			dir = other.image_angle + random_range(-9,9);
			image_angle = dir;
			image_xscale = 1.25;
			image_yscale = 1.25;
		}
	}
}

stateBurst = function()
{
	sprite = sMP5;
	bulletnumber = 3;
	spread = 0;
	
	if(countdown <= 0) and shotsFired < bulletnumber //if within standard cooldown AND havent shot a full volley
	{
		if burstRate <= 0 //cooldown time between each of volleys bullets 
		{
			recoil = 16;
			screenShake(6,12);
			with (instance_create_layer(x,y,"Shots",oEnemyShot))
			{
				damage = other.damage;
				spd = other.setspeed;
				oSFX.enemyShot = snShotHLPist;
				dir  = other.image_angle + random_range(-other.accuracy,other.accuracy);
				image_angle = dir;
				image_xscale = max(1,spd/sprite_width);
			}
			burstRate = burstReset;
			shotsFired++;
		}
		burstRate--;
	}
	else if shotsFired == bulletnumber
	{
		countdown = cdr;
		shotsFired = 0;
	}
}

stateShotgun = function()
{
	sprite = sSPAS12;
	bulletnumber = 5;
	var _spread = 15;
	var _spreadDiv = _spread / max( bulletnumber - 1, 1 );
	
	if(countdown <= 0)
	{
		countdown = countdownRate;
		recoil = 16;
		screenShake(6,12);
	
		for (var j = 0; j < bulletnumber; j++)
		{
			with (instance_create_layer(x,y,"Shots",oEnemyShot))
			{
				damage = other.damage;
				oSFX.enemyShot = snShotSPAS12;
				spd = other.setspeed;
				dir  = other.image_angle- _spread/2 + _spreadDiv * j + random_range(-other.accuracy,other.accuracy);
				image_angle = dir;
				image_xscale = max(1,spd/sprite_width);
			}
		}
	}	
}