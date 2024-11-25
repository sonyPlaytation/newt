

homingShot();

//horizontal collision
if (place_meeting(x+hsp,y,oCollide))
{
	while (!place_meeting(x+sign(hsp),y,oCollide))
	{
		x = x + sign(hsp)
	}

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

	instance_destroy();	
	outline_end();
}
	
y += vsp;

image_angle += abs(vsp)
spd = max(15, spd*0.97);


if place_meeting(x,y,pEntity)
{

	instance_destroy();	
}

image_angle -=10;