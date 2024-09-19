
//screen pause
if screenPause() {exit;};

if instance_exists(homingtarget)
{
	var targetdir = point_direction(x,y,homingtarget.x,homingtarget.y-homingtarget.sprite_height/2)
	dir += sin(degtorad(targetdir-dir))*spd;
}
image_angle = dir
xspd = lengthdir_x(spd, dir);
yspd = lengthdir_y(spd, dir);

x += xspd;
y += yspd;

with instance_create_depth(x,y,depth+10,oFireballTrail)
{
	owner = other.id;
}

if !friendly and (place_meeting(x,y,oNewt))
{
	homingtarget = oNewt;
	with(instance_place(x,y,oNewt))
	{
		playerHit(other.damage);
	}
	if (oNewt.iFrames <= 0) {instance_destroy();} //dont destroy projectile if invincible
}

if friendly 
{
	homingtarget = owner;
	image_xscale = 3;
	if parried and ((place_meeting(x,y,pEntity)) or (place_meeting(x,y,oCollide)))
	{
		spd = 12;
		instance_destroy();
		with instance_create_depth(x,y,-500,oExplosion)
		{
			diedFrom = "overkill";
			friendly = 1;
			baseDMG = 90*other.damage;	
		}	
		
	}
	else if parried = false
	{	
		//screen pause
		if screenPause() {exit;};

		xspd = lengthdir_x(spd, dir);
		yspd = lengthdir_y(spd, dir);

		x += xspd;
		y += yspd;

		if (place_meeting(x,y,pEntity)) 
		{
			dist = point_distance(oNewt.x,oNewt.y-22,x,y);
			var target = (instance_place(x,y,pEntity));
	
	
			with target
			{
		
				if !inactive
				{
					diedFrom = "overkill";
					//damage calculation
						
					finalDMG = 75
			
					//subtract health
					hp -= finalDMG;
			
					//damage numbers
					if (!noDMG)
					{
						repeat(irandom_range(7,20)) {(instance_create_layer(target.x,target.y, "Player", oBlood))}
						myDamage.damage += finalDMG;
						myDamage.alpha = 1;
						myDamage.dmgTextScale = 0.75
					}		
					flash = 3;
					hitfrom = other.direction;
					if (hitsound != 0)	oSFX.scientistscream = true;
				}
			}
			outline_end();
			instance_destroy();
		}

		if (place_meeting(x+xspd,y+yspd,oCollide))
		{
			global.hasCrit = false;
			instance_destroy();
			outline_end();
		}
	}
}
if (place_meeting(x,y,oCollide)) or (place_meeting(x,y,oShotFireball)) instance_destroy();



