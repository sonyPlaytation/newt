

//hitStop(0);
var hitTargs = ds_list_create();
var enemyNum = collision_ellipse_list(x-100,y-100,x+100,y+100,pEntity,0,0,hitTargs,1);
if instance_exists (oNewt) {dist = point_distance(oNewt.x,oNewt.y-22,x,y)}else dist = 50;

if (friendly = 1 ) or (friendly = 0) and (image_index <0.5)
{
	if (place_meeting(x,y,pEntity)) and enemyNum >0
	{
		for (var i=0; i < enemyNum; i++;)
		{
			var target = ds_list_find_value(hitTargs,i);
	
			with target
			{
				if !inactive
				{
					diedFrom = other.diedFrom;
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
}
ds_list_destroy(hitTargs);