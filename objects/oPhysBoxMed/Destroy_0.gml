

// Inherit the parent event
event_inherited();

var rand = irandom_range(3,5);

repeat(rand)
{
	var randX = phy_position_x + random_range(-sprite_width/2,sprite_width/2);
	var randY = phy_position_y + random_range(-sprite_height/2,sprite_height/2);
	
	instance_create_depth(randX,randY,depth,oFragBoxLarge);
	
	repeat (5){instance_create_layer(phy_position_x,phy_position_y, homeLayer, oDust);}
}