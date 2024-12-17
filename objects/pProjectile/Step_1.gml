

//screen pause
if screenPause() {exit;};

homingShot();

if crit {color = c_red; draw_set_color(color);};

if instance_exists(oNewt)
{
	dist = point_distance(xstart,ystart,x,y);
	
	if (place_meeting(x,y,oHeadHitbox)) 
	{
		var target = (instance_place(x,y,oHeadHitbox));
		with (target.owner)
		{
			if !inactive
			{	
				diedFrom = "standard";
				
				//damage calculation
				if (other.crit or oWeapon.headshots) {finalDMG = other.baseDMG * 3}
				else finalDMG = standardFalloff(other.dist,other.baseDMG);
						
				enemyHit(finalDMG, true);
			}
		}
		outline_end();
		instance_destroy();
	}
	
	else if (place_meeting(x,y,pEntity)) 
	{
		var target = (instance_place(x,y,pEntity));
		with (target)
		{
			if !inactive
			{
				diedFrom = "standard";
				//damage calculation
				if (other.crit == true) {finalDMG = other.baseDMG * 3}
				else finalDMG = standardFalloff(other.dist,other.baseDMG);
			
				enemyHit(finalDMG);
			}
		}
		outline_end();
		instance_destroy();
	}
}

if (place_meeting(x,y,oCollide)) && (image_index != 0) 
{
	global.hasCrit = false;
	instance_destroy();
	outline_end();
}


