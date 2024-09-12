

if (!other.inactive) and (friendly = 1 ) or (friendly = 0) //and !collision_line(x, y, other.x, other.y-22, oCollide, 1, 0) and point_in_circle(other.x,other.y,x,y, radius) 
{
	if (place_meeting(x,y,pEntity)) 
	{
		instance_create_depth(0,0,0,oHstop);
		
		if instance_exists (oNewt) {dist = point_distance(oNewt.x,oNewt.y-22,x,y)}else dist = 50;
		var target = (instance_place(x,y,pEntity));
	
		with target
		{
			if !inactive
			{
				diedFrom = "overkill";
				//damage calculation
				if (other.crit == true) {finalDMG = other.baseDMG * 3}
				else finalDMG = standardFalloff(other.dist,other.baseDMG);
			
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
		
				//if rolled a crit
				if (other.crit == true)
				{
					if !noDMG {myDamage.dmgTextScale = 1};
				
					with instance_create_layer(target.x,target.y - target.sprite_height,"Player",oCritHeader)
					{
						owner = target.id	
					}
				} else {global.critTotalDMG += finalDMG}
			
				flash = 3;
				
				
				hitfrom = other.direction;
				if (hitsound != 0)	oSFX.scientistscream = true;
		
			}
		}
	}
}

