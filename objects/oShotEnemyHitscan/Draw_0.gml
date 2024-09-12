/// @description Insert description here
// You can write your code in this editor

cur_x = prev_x +lengthdir_x(3,image_angle);
cur_y = prev_y +lengthdir_y(3,image_angle);

if instance_exists(oNewt){
if check = true
	{
		repeat	(300)
		{
			var coll = collision_line(prev_x, prev_y, cur_x, cur_y, oNewt, true, true);
			
			if coll != noone 
			{
				check = false;
				if can_damage
				{
					with (coll)
					{
						playerHit();
						
					}
				}
				can_damage = false;

			}
			var coll = collision_line(prev_x, prev_y, cur_x, cur_y, oCollide, true, true);
			if coll != noone {
				
				can_damage = false;
				check = false;
			}
			if (check == false) break;
			prev_x = cur_x;
			prev_y = cur_y;
			cur_x = prev_x + lengthdir_x(3,image_angle);
			cur_y = prev_y + lengthdir_y(3,image_angle);
			
		}
	}
	}
	draw_alpha -= 0.3;
	draw_set_alpha(draw_alpha);
	draw_set_color(c_yellow);
	draw_line(x,y,cur_x,cur_y);
	draw_set_alpha(1);
	
	if draw_alpha <= 0 instance_destroy();
	
	