
//screen pause
if screenPause() {exit;};

x = owner.x;
y = owner.y - 20;

damage = owner.damage;

image_xscale = abs(owner.image_xscale);
image_yscale = abs(owner.image_yscale);
inSight -= 0.2;

if (instance_exists(pAlly)) and !owner.inactive 
{
	lineOfSight(0,viewRange);
	if instance_exists(target)
	{
		inSight = 3;
		if (target.x < x) image_yscale = -image_yscale;
		var shotAngle = point_direction(x,y,target.x,target.y-(target.sprite_height/2));
		image_angle = shotAngle;
		countdown--;
		if(countdown <= 0)
		{
			countdown = countdownRate;
			recoil = 16;
			screenShake(2,5);
	
			with (instance_create_layer(x,y,"Shots",oEnemyShot))
			{
				damage = other.damage;
				audio_play_sound(snShotHLPist,500,false)
				spd = other.setspeed;
				dir = other.image_angle + random_range(-9,9);
				image_angle = dir;
				image_xscale = 1.25;
				image_yscale = 1.25;
			}
		}
	}
	
}
	recoil = max(0,recoil - 1);
x = x - lengthdir_x(recoil, image_angle);
y = y - lengthdir_y(recoil, image_angle);
	
