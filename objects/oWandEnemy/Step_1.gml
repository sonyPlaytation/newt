
//screen pause
if screenPause() {exit;};

x = owner.x;
y = owner.y - 20;

damage = owner.damage;

	if instance_exists(oNewt){var newtCenter = oNewt.y-20};

image_xscale = abs(owner.image_xscale);
image_yscale = abs(owner.image_yscale);
inSight -= 0.2;

if (instance_exists(oNewt)) and !owner.inactive 
{
	if (oNewt.x < x) image_yscale = -image_yscale;
	
	if (point_distance(oNewt.x,newtCenter,x,y) < viewRange) and !collision_line(x, y, oNewt.x,newtCenter, oCollide, true, true)
	{
		image_angle = point_direction(x,y,oNewt.x,newtCenter);
		inSight = 1;
		
		countdown--;
		if(countdown <= 0)
		{
			countdown = countdownRate;
			recoil = 16;
			screenShake(4,10);
	
			with (instance_create_layer(x,y,"Shots",oEnemyShot))
			{
				damage = other.damage;
				audio_play_sound(snShotHLPist,500,false)
				spd = other.setspeed;
				dir = other.image_angle + random_range(-9,9);
				image_angle = dir;
				image_xscale = max(1,spd/sprite_width);
			}
		}
	}
}
	recoil = max(0,recoil - 1);
x = x - lengthdir_x(recoil, image_angle);
y = y - lengthdir_y(recoil, image_angle);
	
