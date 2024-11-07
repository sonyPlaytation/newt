/// @description Insert description here
// You can write your code in this editor

if instance_exists(owner)
{
	x = owner.x;
	y = owner.headY;
	selfCenter = y-9;
	if owner.image_xscale == 1{restAng = 0}else restAng = 180;

	if (abs(image_angle) > 90) and (abs(image_angle) < 270) {image_yscale = -1} else image_yscale = 1;
	inSight -= 0.2;
	
	if instance_exists(pEntity)
	{
		lineOfSight();

		if instance_exists(target)
		{
			inSight = 3;
			if !collision_line(x,selfCenter,target.x,target.y-(target.sprite_height/2),oCollide,0,0) //aim and fire
			{

				shotTimer--;
				var shotAngle = point_direction(x,selfCenter,target.x,random_range(target.bbox_top, target.bbox_bottom));
				image_angle += angle_difference(shotAngle,image_angle)*0.15;
			
				if shotTimer < 0
				{
					if ammo > 0
					{
						audio_play_sound(snSentryShot,500,false);
						with instance_create_depth(x+lengthdir_x(20,image_angle),selfCenter+lengthdir_y(20,image_angle),depth+10,oShotSentry)
						{
							crit = false;
							global.hasCrit = false;
							headshot = false;
							shotNumber = 0;
							hitSprite = sHitLine;
							dir = other.image_angle;
							spd = 0;
							image_angle = dir+random_range(-3,3);
							image_xscale = max(1,spd/sprite_width);
						}
						ammo--;
					}
					else
					{
						audio_play_sound(snNoAmmo,250,false);
					}
					shotTimer = shotReset;
				}
			}
		}
		else image_angle += angle_difference(restAng,image_angle)*0.05;
	}
	else image_angle += angle_difference(restAng,image_angle)*0.05;
}

