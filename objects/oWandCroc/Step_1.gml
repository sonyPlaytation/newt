
//screen pause
if screenPause() {exit;};

x = owner.x;
y = owner.y - 20;

damage = owner.damage;

	if instance_exists(oNewt){var newtCenter = oNewt.y-20};

image_xscale = abs(owner.image_xscale);
image_yscale = abs(owner.image_yscale);
inSight -= 0.2;

var _spread = spread;
var _spreadDiv = _spread / max( bulletnumber - 1, 1 );

if (instance_exists(oNewt))  and !owner.inactive
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
			screenShake(6,12);
	
			for (var j = 0; j < bulletnumber; j++)
			{
				with (instance_create_layer(x,y,"Shots",oEnemyShot))
				{
					damage = other.damage;
					oSFX.crocshot = true;
					spd = other.setspeed;
					dir  = other.image_angle- _spread/2 + _spreadDiv * j + random_range(-other.accuracy,other.accuracy);
					image_angle = dir;
					image_xscale = max(1,spd/sprite_width);
				}
			}
		}
	} else countdown = countdownRate;
}
	recoil = max(0,recoil - 1);
x = x - lengthdir_x(recoil, image_angle);
y = y - lengthdir_y(recoil, image_angle);
	
if (image_angle > 90) && (image_angle < 270)
{
	image_yscale = -1;
} else image_yscale = 1;