/// @description Insert description here
// You can write your code in this editor

cur_x = prev_x +lengthdir_x(5,image_angle);
cur_y = prev_y +lengthdir_y(5,image_angle);

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
				check = false;
				if can_damage 
				{	
					repeat(15)tracerDMG += irandom_range(1,8);
					dist = point_distance(xstart,ystart,target.x,target.y);
					with (target.owner)
					{
						diedFrom = "overkill";
						//damage calculation
						
						finalDMG = other.tracerDMG*oInv.dmgMod;
			
						//subtract health
						hp -= finalDMG;
			
						//damage numbers
						if (!noDMG)
						{
							repeat(irandom_range(7,20)/oMultiWeapon.bulletnumber) {(instance_create_layer(target.x,target.y, layer, oBlood))}
							myDamage.damage += finalDMG;
							myDamage.alpha = 1;
							myDamage.dmgTextScale = 0.75
						}

						global.critTotalDMG += finalDMG; 
			
						flash = 3;
						hitfrom = other.direction;
						if (hitsound != 0)	oSFX.scientistscream = true;
						
					}
				}
				can_damage = false;
			}
			
			//check for body hitbox
			var target= collision_line(prev_x, prev_y, cur_x, cur_y, pEntity, true, true);
			if (target!= noone) and (target.inactive == false) 
			{

				check = false;
				if can_damage 
				{	
					repeat(15)tracerDMG += irandom_range(1,8);
					dist = point_distance(xstart,ystart,target.x,target.y);
					with (target)
					{
						diedFrom = "overkill";
						//damage calculation
						finalDMG = other.tracerDMG;
			
						//subtract health
						hp -= finalDMG;
			
						//damage numbers
						if (!noDMG)
						{
							repeat(irandom_range(7,20)/oMultiWeapon.bulletnumber) {(instance_create_layer(target.x,target.y, layer, oBlood))}
							myDamage.damage += finalDMG;
							myDamage.alpha = 1;
							myDamage.dmgTextScale = 0.75
						}
		
						global.critTotalDMG += finalDMG;
			
						flash = 3;
						hitfrom = other.direction;
						if (hitsound != 0)	oSFX.scientistscream = true;
						coinHit = true;
						
					}
				}
				can_damage = false;
			}
				
			//check for walls
			var target= collision_line(prev_x, prev_y, cur_x, cur_y, oCollide, true, true);
			if target!= noone {
				
				//dist = point_distance(xstart,ystart,target.x,target.y); 
				//fix this. 
				//currently because im stretching out 
				//my collision tiles it measures based on distance relative to the top left 
				//corner which distorts the visual element of the shot
				
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

if hitSprite!=noone
{

	draw_alpha -= 0.07;
	draw_set_alpha(draw_alpha);	
	
	// hitscan glow 
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(
	hitSprite,
	1,
	x,
	y,
	visDist,
	round_Ext(2*(draw_alpha/2),0.25)*5,
	dir,
	col,
	0.15);
	
	gpu_set_blendmode(bm_normal);
	
	//--------------------------------------------------------------//
	
	// hitscan line real
	draw_sprite_ext(
	hitSprite,
	1,
	x,
	y,
	visDist,
	round_Ext(2*(draw_alpha/2),0.25),
	dir,
	col,
	1);
	
	draw_set_alpha(1);
}

if draw_alpha <= 0 instance_destroy();
	
	//railgun 25.80 300/30
	//markaman 77.77 66.66/10
	//target is 
	//516
