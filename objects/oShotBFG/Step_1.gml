/// @description Insert description here
// You can write your code in this editor

//screen pause
if screenPause() {exit;};

guidedShot();

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
				enemyHit(20)
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

