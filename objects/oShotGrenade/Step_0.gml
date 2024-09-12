
//screen pause
if screenPause() {exit;};

with(self){
vsp += grv;
//horizontal collision
if (place_meeting(x+hsp,y,oCollide))
{
	while (!place_meeting(x+sign(hsp),y,oCollide))
	{
		x += sign(hsp);
	}
	hsp = 0;
	speed /= 4;
	direction = -direction;
	
}
x += hsp;

//vertical collision
if (place_meeting(x,y+vsp,oCollide))
{
	while (!place_meeting(x,y+sign(vsp),oCollide))
	{
		y += sign(vsp);
	}
	vsp = 0;
	speed /= 2;
}
y += vsp;
}

if instance_exists(oShotStarter)
{
	if (point_in_circle(oShotStarter.x,oShotStarter.y,x,y,22))
	{	
		
		flash = 5;
		alarm[0] = 5;
		with instance_nearest(x,y,oShotStarter){instance_destroy()};
	}
}