/// @description Insert description here
// You can write your code in this editor

	
	
	vsp = vsp + grv;
	
	with instance_create_depth(x,y,depth,oBloodSmall)
	{
		
	};
	
	image_angle +=30;

	//horizontal collision
	if (place_meeting(x+hsp,y,oCollide)){instance_destroy();}else {x += hsp;}

	//vertical collision
	if (place_meeting(x,y+vsp,oCollide)){instance_destroy();}else {y += vsp;}


