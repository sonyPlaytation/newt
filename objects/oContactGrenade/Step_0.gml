

if global.soda[1] == true and instance_exists(pEnemy)
{
	
	var targetdir = point_direction(x,y,homingtarget.x,homingtarget.y-homingtarget.sprite_height/2)
	dir += sin(degtorad(targetdir-dir))*spd;
		
	image_angle = dir
	hsp = lengthdir_x(spd, dir);
	vsp = lengthdir_y(spd, dir);

	x += hsp;
	y += vsp;
	
	color = c_fuchsia;
	draw_set_color(color);
}
else
{
	hsp = lengthdir_x(spd, dir);
	vsp = lengthdir_y(spd, dir);

	x += hsp;
	y += vsp;
}

//horizontal collision
if (place_meeting(x+hsp,y,oCollide))
{
	while (!place_meeting(x+sign(hsp),y,oCollide))
	{
		x = x + sign(hsp)
	}
	instance_create_layer(x,y,"Shots",oExplosion);
	instance_destroy();	
	outline_end();
}

x += hsp;
	
//vertical collision
if (place_meeting(x,y+vsp,oCollide))
{
	while (!place_meeting(x,y+sign(vsp),oCollide))
	{
		y += sign(vsp)
	}
	instance_create_layer(x,y,"Shots",oExplosion);
	instance_destroy();	
	outline_end();
}
	
y += vsp;

image_angle += abs(vsp)
spd = max(15, spd*0.97);


if place_meeting(x,y,pEntity)
{
	instance_create_layer(x,y,"Shots",oExplosion);
	instance_destroy();	

}

image_angle -=10;