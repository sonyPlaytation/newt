
//screen pause
if screenPause() {exit;};

x = owner.x;
y = owner.y - 20;

damage = owner.damage;

image_xscale = abs(owner.image_xscale);
image_yscale = abs(owner.image_yscale);
inSight -= 0.2;
if (image_angle > 90) and (image_angle <270){image_yscale = -1} else image_yscale = 1;; 
sprite_index = sprite;

if (instance_exists(pAlly)) and !owner.inactive 
{
	lineOfSight(0,viewRange);
	if instance_exists(target)
	{
		inSight = 3;
		var shotAngle = point_direction(x,y,target.x,target.y-(target.sprite_height/2));
		image_angle = shotAngle;
		countdown--;
		state();
	}
}
recoil = max(0,recoil - 1);
x = x - lengthdir_x(recoil, image_angle);
y = y - lengthdir_y(recoil, image_angle);
	
