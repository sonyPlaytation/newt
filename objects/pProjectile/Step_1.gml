

//screen pause
if screenPause() {exit;};

var homingtarget = instance_nearest(mouse_x,mouse_y,pEnemy);
if global.soda[1] == true and instance_exists(pEnemy)
{
	if !collision_line(x,y,homingtarget.x,homingtarget.y,oCollide,0,0)
	{
		var targetdir = point_direction(x,y,homingtarget.x,homingtarget.y-homingtarget.sprite_height/2)
		dir += sin(degtorad(targetdir-dir))*8;
	}
		
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
if crit {color = c_red; draw_set_color(color);};

if instance_exists(oNewt)
{
	dist = point_distance(xstart,ystart,x,y);
	
	if (place_meeting(x,y,oHeadHitbox)) 
	{
		var target = (instance_place(x,y,oHeadHitbox));
		with target.owner
		{
			if !inactive
			{	
				diedFrom = "standard";
				
				//damage calculation
				if (other.crit or oMultiWeapon.headshots) {finalDMG = other.baseDMG * 3}
				else finalDMG = standardFalloff(other.dist,other.baseDMG);
						
				//subtract health
				hp -= finalDMG;
			
				//damage numbers
				if (!noDMG)
				{
					repeat(irandom_range(7,20)) {(instance_create_layer(target.x,target.y-(sprite_height/2), "Player", oBlood))}
					myDamage.damage += finalDMG;
					myDamage.alpha = 1;
					myDamage.dmgTextScale = 0.75
				}
		
				//if rolled a crit
				if (other.crit or oMultiWeapon.headshots)
				{
					diedFrom = "headshot";
					myDamage.dmgTextScale = 1;
				
					with instance_create_layer(target.x,target.y - target.sprite_height,"Player",oCritHeader)
					{
						owner = target.id	
					}
				} else {global.critTotalDMG += finalDMG}
			
				flash = 3;
				hitfrom = other.direction;		
				coinHit = true;
			}
		}
	
		outline_end();
		instance_destroy();
	}
	
	if (place_meeting(x,y,pEntity)) 
	{
		hitStop(2);
		var target = (instance_place(x,y,pEntity));
		with target
		{
			if !inactive
			{
				diedFrom = "standard";
				//damage calculation
				if (other.crit == true) {finalDMG = other.baseDMG * 3}
				else finalDMG = standardFalloff(other.dist,other.baseDMG);
			
				//subtract health
				hp -= finalDMG;
			
				//damage numbers
				if (!noDMG)
				{
					repeat(irandom_range(7,20)) {(instance_create_layer(target.x,target.y-(sprite_height/2), "Player", oBlood))}
					myDamage.damage += finalDMG;
					myDamage.alpha = 1;
					myDamage.dmgTextScale = 0.75
				}
		
				//if rolled a crit
				if (other.crit == true)
				{
					myDamage.dmgTextScale = 1;
				
					with instance_create_layer(target.x,target.y - target.sprite_height,"Player",oCritHeader)
					{
						owner = target.id	
					}
				} else {global.critTotalDMG += finalDMG}
			
				flash = 3;
				hitfrom = other.direction;			
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


