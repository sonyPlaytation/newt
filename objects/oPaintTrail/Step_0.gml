/// @description

x += hsp;
y += vsp;



if collision_point(x,y,oCollide,false,false)
{
	if surface_exists(global.splatLayer) and (!lengthMatters or length > 0)
	{
		surface_set_target(global.splatLayer)
			
		if length < lengthMax 
		{
			draw_sprite_ext(sprite_index,1,x,y,size,size,0,color,1);		
		};
			
		surface_reset_target();
		length--
		vsp *= 0.85;
		size *= 0.85;
	}
	else if length <= 0 {instance_destroy()};
}

if length < lengthMax and !(place_meeting(x,y,oCollide)){instance_destroy()};

image_xscale = size;
image_yscale = size;

XPrev = x;
YPrev = y;