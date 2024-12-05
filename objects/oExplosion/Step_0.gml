

if instance_exists(oNewt)
{
	if (friendly = -1 ) or (friendly = 0 ) 
	and collision_circle(x,y,radius,oNewt,0,0) 
	and !collision_line(x, y, oNewt.x, oNewt.y-22, oCollide, 1, 0) 
	and (image_index == 0) 
	{ playerHit(1,oNewt) };

	pushDistH = min(point_distance(oNewt.x,global.newtCenter,x,y),15);
	pushDistV = min(point_distance(oNewt.x,global.newtCenter,x,y)/6,15);
	pushAng = point_direction(oNewt.x,global.newtCenter,x,y);

	with(oNewt)
	{
		if !onGround and (other.image_index == 0)
		{
			hsp -= lengthdir_x(other.pushDistH,other.pushAng);
			vsp -= lengthdir_y(other.pushDistV,other.pushAng);
		}
	}
}

//phys props
var hitProps = ds_list_create();
var propNum = collision_ellipse_list(x-100,y-100,x+100,y+100,pPhysProp,0,0,hitProps,1);
if instance_exists (oNewt) {dist = point_distance(oNewt.x,oNewt.y-22,x,y)}else dist = 50;

if (friendly = 1 ) or (friendly = 0) and (image_index <0.5)
{
	if (place_meeting(x,y,pPhysProp)) and propNum > 0
	{
		for (var i=0; i < propNum; i++;)
		{
			var prop = ds_list_find_value(hitProps,i);
			if !collision_line(x, y, prop.x, prop.y-22, oCollide, 0, 0)
			with prop
			{
				idleTimer = 0;
				phy_active = true;
				
				var physDir = point_direction(other.x,other.y,phy_position_x,phy_position_y)
				var physX = lengthdir_x(100,physDir)*(1000-(prop.phy_mass));
				var physY = lengthdir_y(100,physDir)*(1000-(prop.phy_mass));
				
				physics_apply_impulse(other.x,other.y,physX,physY);
				
				diedFrom = "standard";
			
				var _dmg = 100;
				hp -= _dmg;
			
				global.critTotalDMG += _dmg;
			
				flash = 3;			
				hitfrom = other.direction;	
			}
		}
	} 
}
ds_list_destroy(hitProps);

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
			if !collision_line(x, y, target.x, target.y-22, oCollide, 0, 0)
			with target
			{
				if !inactive and !object_is_ancestor(target.object_index,pPhysProp)
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
				}
			}
		}
	} 
}
instance_destroy();
ds_list_destroy(hitTargs);



