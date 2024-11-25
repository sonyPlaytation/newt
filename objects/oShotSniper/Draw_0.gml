/// @description Insert description here
// You can write your code in this editor

cur_x = prev_x +lengthdir_x(5,image_angle);
cur_y = prev_y +lengthdir_y(5,image_angle);

hitTargs = ds_list_create();

if instance_exists(oNewt)
{
	if check = true
	{
		repeat	(300)
		{
			visDist += sprite_get_width(hitSprite)/10;
			//check for head hitbox
			var target= collision_line(prev_x, prev_y, cur_x, cur_y, oHeadHitbox, true, true);
			if (target!= noone) and (target.inactive == false) 
			{
				ds_list_add(hitTargs,target.id);
				
				if  oShotSniperLaser.image_alpha == 0 {check = false};
				if can_damage 
				{	
					dist = point_distance(xstart,ystart,target.x,target.y);
					with (target.owner)
					{
						if oShotSniperLaser.image_alpha !=0 
						{
							diedFrom = "standard";
							finalDMG = sniperFalloff(other.dist,50)
							with instance_create_layer(target.x,target.y - target.sprite_height,"Player",oCritHeader)
							{
								owner = target.id	
							}
						} 
						else
						{
							diedFrom = "standard";
							finalDMG =  ceil(clamp(other.baseDMG * (other.baseDMG / (other.dist/12)),other.baseDMG * 1 ,other.baseDMG * 2.5))
						}
						
						enemyHit(finalDMG,true);
					}
				}
				if  oShotSniperLaser.image_alpha == 0 {can_damage = false};
			}
			
			//check for body hitbox
			var target= collision_line(prev_x, prev_y, cur_x, cur_y, pEntity, true, true);
			if (target!= noone) and (target.inactive == false) 
			{

				check = false;
				if can_damage 
				{	
					dist = point_distance(xstart,ystart,target.x,target.y);
					with (target)
					{
						
						diedFrom = "standard";
						finalDMG =  standardFalloff(other.dist,other.baseDMG);
						
						enemyHit(finalDMG);						
					}
				}
				can_damage = false;
			}
				
			//check for walls
			var target= collision_line(prev_x, prev_y, cur_x, cur_y, oCollide, true, true);
			if target!= noone 
			{	
				if ds_list_size(hitTargs) > 3
				{
					oSFX.collat = true;
				}
				
				can_damage = false;
				check = false;
			}
			if (check == false) break;
			prev_x = cur_x;
			prev_y = cur_y;
			cur_x = prev_x + lengthdir_x(5,image_angle);
			cur_y = prev_y + lengthdir_y(5,image_angle);
			global.hasCrit = false;
		}
	}
}

drawHitscan()