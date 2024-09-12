/// @description Insert description here
// You can write your code in this editor



repeat(irandom_range(5,15)) 
{
	with (instance_create_layer(x,y-(sprite_height/2), layer, oDust))
	{
		depth -= 1000;
	}
}
