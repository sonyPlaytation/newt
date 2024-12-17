/// @description

if length < lengthMax and !(place_meeting(x,y,oCollide)){instance_destroy()};

vsp = vsp + grv;
	
x += hsp
y += vsp;

if collision_point(x,y,oCollide,false,false)
{
	if surface_exists(global.splatLayer) and (!lengthMatters or length > 0)
	{
		surface_set_target(global.splatLayer)
			
		if length < lengthMax 
		{
			draw_sprite_ext(sprite_index,1,x,y,size,size,0,color,1);	
			draw_line_width_color(x,y,XPrev,YPrev,(sprite_width/2)*size,color,color)
		};
			
		surface_reset_target();
		length--
		size *= 0.5;
	}
	else if length <= 0 {instance_destroy()};
}

XPrev = x;
YPrev = y;


