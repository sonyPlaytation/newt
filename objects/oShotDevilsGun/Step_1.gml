/// @description Insert description here
// You can write your code in this editor

//screen pause
if screenPause() {exit;};

xspd = lengthdir_x(spd, dir);
yspd = lengthdir_y(spd, dir);

x += xspd;
y += yspd;

with instance_create_depth(x,y,depth,oDevilsGunParticle){owner = other.id; image_angle = owner.image_angle;}

if crit {draw_set_color(c_red)};

if instance_exists(oNewt)
{
	dist = point_distance(oNewt.x,oNewt.y-22,x,y);
	
	if (place_meeting(x,y,oHeadHitbox)) 
	{
		var target = (instance_place(x,y,oHeadHitbox));
		
		var _refund = irandom(3);
		if _refund = 3 {with(oMultiWeapon) {ammo[ammotype]+=3}};
		
		with target.owner
		{
		
			if !inactive
			{	
				diedFrom = "fire";
				
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
					
					with instance_create_layer(target.x,target.y - target.sprite_height/2,"Player",oExplosion)
					{
						radius = 125;
					}
				
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

	if (place_meeting(x,y,pEntity)) 
	{
	
		dist = point_distance(oNewt.x,oNewt.y-22,x,y);
		var target = (instance_place(x,y,pEntity));
	
		var _refund = irandom(3);
		if _refund = 3 {with(oMultiWeapon) {ammo[ammotype]+=3}};
	
		with target
		{
		
			if !inactive
			{
				diedFrom = "fire";
				//damage calculation
				if (other.crit == true) {finalDMG =other.baseDMG + floor(15*oHealthBar.hpMissing) * 3}
				else finalDMG = standardFalloff(other.dist,other.baseDMG)+ floor(15*oHealthBar.hpMissing);
			
				//subtract health
				hp -= finalDMG ;
			
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
					if !noDMG {myDamage.dmgTextScale = 1};
				
					with instance_create_layer(target.x,target.y - target.sprite_height/2,"Player",oExplosion)
					{
						radius = 125;
					}
				
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


