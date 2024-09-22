/// @description Insert description here
// You can write your code in this editor

//screen pause
if screenPause() {exit;};

var homingtarget = instance_nearest(mouse_x,mouse_y,pEnemy);
if global.soda[1] == true and instance_exists(pEnemy)
{
	tracerAngle = oMultiWeapon.image_angle;
	var targetdir = point_direction(x,y,homingtarget.x,homingtarget.y-homingtarget.sprite_height/2)
	dir += sin(degtorad(targetdir-dir))*5;
		
	image_angle = dir
	xspd = lengthdir_x(spd, dir);
	yspd = lengthdir_y(spd, dir);

	x += xspd;
	y += yspd;
	
	color = c_fuchsia;
	draw_set_color(color);
}
else
{
	xspd = lengthdir_x(spd, dir);
	yspd = lengthdir_y(spd, dir);

	x += xspd;
	y += yspd;
}
if (instance_exists(oNewt))
{

	if !done {spd += 0.05};

	var _spread = tracerSpread;
	var _spreadDiv = _spread / max( tracerNumber - 1, 1 );


	if (place_meeting(x,y,pEntity))
	{

		ballHealth-= 20;
	
		with(instance_place(x,y,pEntity))
		{
		
			if !inactive and (other.done == false)
			{
				diedFrom = "overkill";
				
				hp-= 20;
		
				if (!noDMG)
				{
					myDamage.damage += 20;
					myDamage.alpha = 1;
					myDamage.dmgTextScale = 0.75
				}
		
				flash = 3;
				hitfrom = other.direction;
				if (hitsound != 0)	oSFX.scientistscream = true;
			}
		}
	}

	if (collision_circle(x,y,3,oCollide,1,1)) && (image_index != 0) ballHealth = 0;

	if (ballHealth <= 0) and (done == false)
	{
		spd = 0;
		image_angle = 0;
		image_index = 0;
		sprite_index = sShotBFGspray;	
		done = true
	}

	if (image_index == 2)
	{
		for (var j = 0; j < tracerNumber; j++)
			{
				with (instance_create_layer(oNewt.x,oNewt.y-22,"Shots",oShotBFGTracer))
				{
					direction = other.tracerAngle - _spread/2 + _spreadDiv * j + random_range(-other.accuracy,other.accuracy);
					damage = other.damage;
					image_angle = direction;
					dir = direction;
				}
			}
	};
			




	if (sprite_index == sShotBFGspray) && (image_index == 6)
	{
		instance_destroy()
	};
}

