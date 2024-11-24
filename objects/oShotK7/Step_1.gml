



//screen pause
if screenPause() {exit;};

var homingtarget = instance_nearest(mouse_x,mouse_y,pEnemy);
if global.soda[1] == true and instance_exists(pEnemy)
{
	
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
				//if scoped minicrit
				if oWeapon.showLaser == true
				{
					diedFrom = "killer7";
					if hitsound != -1 {oSFX.k7hurt = true};
				
					//damage calculation
					
					finalDMG = round(other.baseDMG*1.35);
						
					//subtract health
					hp -= finalDMG;
			
					//damage numbers
					if (!noDMG)
					{
						myDamage.damage += finalDMG;
						myDamage.alpha = 1;
						
						//normal crit stuff
						myDamage.dmgTextScale = 1;
						with instance_create_layer(target.x,target.y - target.sprite_height,"Player",oCritHeader)
						{
							image_index = 1; //minicrit header;
							owner = target.id	
						}
					}
		
					
				
				}
				else
				{
					//if normal crit or noncrit damage
					if oWeapon.showLaser == true
					diedFrom = "standard";
					if hitsound != -1 {oSFX.k7hurt = true};
				
					//damage calculation
					if (other.crit or oWeapon.headshots) {finalDMG = other.baseDMG * 3}
					else finalDMG = standardFalloff(other.dist,other.baseDMG);
						
					//subtract health
					hp -= finalDMG;
			
					//damage numbers
					if (!noDMG)
					{
						myDamage.damage += finalDMG;
						myDamage.alpha = 1;
						myDamage.dmgTextScale = 0.75
					}
		
					//if rolled a crit
					if (other.crit or oWeapon.headshots)
					{
						myDamage.dmgTextScale = 1;
						with instance_create_layer(target.x,target.y - target.sprite_height,"Player",oCritHeader)
						{
							image_index = 0; //minicrit header;
							owner = target.id	
						}
					} else {global.critTotalDMG += finalDMG; diedFrom = "standard"}
				
				
					flash = 5;
					hitfrom = other.direction;				
				}
				
				flash = 5;
				hitfrom = other.direction;			
			}
		}
	
		outline_end();
		instance_destroy();
	}
	
	if (place_meeting(x,y,pEntity)) 
	{
		dist = point_distance(oNewt.x,oNewt.y-22,x,y);
		var target = (instance_place(x,y,pEntity));
			
		with target
		{
		
			if !inactive
			{
				if hitsound != -1 {oSFX.k7hurt = true};
				
				//damage calculation
				if (other.crit == true) {finalDMG = other.baseDMG * 3}
				else finalDMG = standardFalloff(other.dist,other.baseDMG);
			
				//subtract health
				hp -= finalDMG;
			
				//damage numbers
				if (!noDMG)
				{
					myDamage.damage += finalDMG;
					myDamage.alpha = 1;
					myDamage.dmgTextScale = 0.75
				}
				
				//if rolled a crit
				if (other.crit == true)
				{
					diedFrom = "killer7";
					if !noDMG {myDamage.dmgTextScale = 1};
				
					with instance_create_layer(target.x,target.y - target.sprite_height,"Player",oCritHeader)
					{
						owner = target.id	
					}
				} else {global.critTotalDMG += finalDMG; diedFrom = "standard"}
				
				flash = 5;
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


