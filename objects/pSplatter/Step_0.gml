/// @description

if length < lengthMax and !(place_meeting(x,y,oCollide)){instance_destroy()};

vsp = vsp + grv;
	
x += hsp
y += vsp;

if (place_meeting(x,y,oCollide))
{
	if surface_exists(global.splatLayer) and (!lengthMatters or length > 0)
	{
		surface_set_target(global.splatLayer)
			
		if length < lengthMax 
		{
			draw_self();
			draw_set_color(color);
			draw_line_width(x,y,XPrev,YPrev,3*size)
		};
			
		surface_reset_target();
		length--
		size *= 0.5;
	}
	else if length <= 0 {instance_destroy()};
}

image_xscale = size;
image_yscale = size;

XPrev = x;
YPrev = y;


