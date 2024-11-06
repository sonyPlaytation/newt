/// @description Insert description here
// You can write your code in this editor
if screenPause() {exit;};

cur_x = prev_x +lengthdir_x(5,image_angle);
cur_y = prev_y +lengthdir_y(5,image_angle);

if hitSprite = sHitFLCL{flashScale = 500}else flashScale = 2;

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
					dist = point_distance(xstart,ystart,target.x,target.y);
					with (target.owner)
					{
						//damage calculation
						if (other.crit or other.headshot) {finalDMG = other.baseDMG * 3}
						else finalDMG = standardFalloff(other.dist,other.baseDMG);
			
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
		
						//if rolled a crit
						if (other.crit or other.headshot)
						{
							diedFrom = "headshot";
							if (!noDMG){myDamage.dmgTextScale = 1;}
							with instance_create_layer(target.x,target.y - target.sprite_height,"Player",oCritHeader)
							{
								owner = target.id	
							}
							
						} else {global.critTotalDMG += finalDMG; diedFrom = "standard";}
			
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
					dist = point_distance(xstart,ystart,target.x,target.y);
					with (target)
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
							repeat(irandom_range(7,20)/oMultiWeapon.bulletnumber) {(instance_create_layer(target.x,target.y, layer, oBlood))}
							myDamage.damage += finalDMG;
							myDamage.alpha = 1;
							myDamage.dmgTextScale = 0.75
						}
		
						//if rolled a crit
						if (other.crit == true)
						{
							if (!noDMG){myDamage.dmgTextScale = 1;}
				
							with instance_create_layer(target.x,target.y - target.sprite_height,"Player",oCritHeader)
							{
								owner = target.id	
							}
						} else {global.critTotalDMG += finalDMG}
			
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

	draw_alpha -= 0.09;
	
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
	
	
	
	//muzzle flash (frame zero)
	if (shotNumber == oMultiWeapon.bulletnumber)
	{
		draw_sprite_ext(hitSprite,0,x,y,flashScale,
		flashScale,
		dir,
		col,
		draw_alpha);
		hitStop(13);
		shotNumber++};
	
	draw_set_alpha(1);
}
else
{
	draw_alpha -= 0.3;
	draw_set_alpha(draw_alpha);
	draw_set_color(c_yellow);
	draw_line(x,y,cur_x,cur_y);
	draw_set_alpha(1);	
}


if draw_alpha <= 0 instance_destroy();
	
	//railgun 25.80 300/30
	//markaman 77.77 66.66/10
	//target is 
	//516
