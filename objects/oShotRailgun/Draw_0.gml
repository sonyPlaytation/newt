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
			if (target!= noone) and (target.inactive == false) and (ds_list_find_index(hitTargs,target) == -1)
			{
				ds_list_add(hitTargs,target.id);
				//check = false;
				if can_damage 
				{	
					dist = point_distance(xstart,ystart,target.x,target.y);
					with (target.owner)
					{
						diedFrom = "overkill";
						//damage calculation
						if (other.crit or oWeapon.headshots) {finalDMG = other.baseDMG * 3}
						else finalDMG = sniperFalloff(other.dist,other.baseDMG);
			
						enemyHit(finalDMG);
					}
				}
				//can_damage = false;
			}
			
			//check for body hitbox
			var target= collision_line(prev_x, prev_y, cur_x, cur_y, pEntity, true, true);
			if (target!= noone) and (target.inactive == false) and (ds_list_find_index(hitTargs,target) == -1)
			{
				ds_list_add(hitTargs,target.id);
				//check = false;
				if can_damage 
				{	
					dist = point_distance(xstart,ystart,target.x,target.y);
					with (target)
					{
						diedFrom = "standard";
						//damage calculation
						if (other.crit == true) {finalDMG = other.baseDMG * 3}
						else finalDMG = sniperFalloff(other.dist,other.baseDMG);
			
						enemyHit(finalDMG);
					}
				}
				//can_damage = false;
			}
				
			//check for walls
			var target= collision_line(prev_x, prev_y, cur_x, cur_y, oCollide, true, true);
			if target!= noone 
			{
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

drawHitscan();