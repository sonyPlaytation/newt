/// @description

// Inherit the parent event

homingShot();

if (place_meeting(x,y,oCollide))
{
	image_index = 1;	
}

if (place_meeting(x,y,pEntity)) 
{
	dist = point_distance(xstart,ystart,x,y);
	var target = (instance_place(x,y,pEntity));
	with (target)
	{
		if !inactive
		{
			diedFrom = "standard";
			//damage calculation
			if (other.crit == true) {finalDMG = oWeapon.damage * 3}
			else finalDMG = standardFalloff(other.dist,oWeapon.damage);
			
			enemyHit(finalDMG);
		}
	}
	outline_end();
	instance_destroy();
}

if length < lengthMax and !(place_meeting(x,y,oCollide)){instance_destroy()};

if collision_point(x,y,oCollide,false,false)
{
	if surface_exists(global.splatLayer) and (!lengthMatters or length > 0)
	{
		surface_set_target(global.splatLayer)
			
		if length < lengthMax 
		{
			draw_set_color(color);
			draw_sprite_ext(sprite_index,1,x,y,size,size,0,color,1);
			
			if place_meeting(XPrev,YPrev,oCollide) {draw_line_width(x,y,XPrev,YPrev,(sprite_width/2))}
		
			with instance_create_depth(x,y,depth,oPaintTrail)
			{
				color = other.color;
			}
			
		};
			
		surface_reset_target();
		length--
		size *= 0.85;
	}
	else if length <= 0 {instance_destroy()};
}

image_xscale = size;
image_yscale = size;

XPrev = x;
YPrev = y;




