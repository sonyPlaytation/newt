/// @description Insert description here
// You can write your code in this editor

//screen pause
if screenPause() {exit;};

homingShot();
with instance_create_layer(x,y,"Shots",oDevilsGunParticle){owner = other.id; image_angle = owner.image_angle;}
if crit {draw_set_color(c_red)};

if instance_exists(oNewt)
{
	dist = point_distance(oNewt.x,oNewt.y-22,x,y);
	
	if (place_meeting(x,y,oHeadHitbox)) 
	{
		var target = (instance_place(x,y,oHeadHitbox));
		
		var _refund = irandom(3);
		if _refund = 3 {with(oWeapon) {ammo[ammotype]+=3}};
		
		with target.owner
		{
		
			if !inactive
			{	
				diedFrom = "standard";
				
				//damage calculation
				if (other.crit or oWeapon.headshots) {finalDMG = other.baseDMG * 3}
				else finalDMG = standardFalloff(other.dist,other.baseDMG);
						
				enemyHit(finalDMG);
			}
		}
		if crit explosion(65,75,x,y,false,1,sExplosionPink);
		outline_end();
		instance_destroy();
	}

	else if (place_meeting(x,y,pEntity)) 
	{
	
		dist = point_distance(oNewt.x,oNewt.y-22,x,y);
		var target = (instance_place(x,y,pEntity));
	
		var _refund = irandom(3);
		if _refund = 3 {with(oWeapon) {ammo[ammotype]+=3}};
	
		with target
		{
			if !inactive
			{	
				diedFrom = "standard";
				
				//damage calculation
				if (other.crit or oWeapon.headshots) {finalDMG = other.baseDMG * 3}
				else finalDMG = standardFalloff(other.dist,other.baseDMG);
						
				enemyHit(finalDMG);
			}
		}
		if crit explosion(65,75,x,y,false,1,sExplosionPink);
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


