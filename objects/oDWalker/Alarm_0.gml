/// @description Insert description here
// You can write your code in this editor

instance_destroy();

repeat(size*multiplier)
{
	instance_create_layer(x,bbox_bottom, "Player", oSpookyGhost);
}

repeat(10)
		{
			instance_create_layer(x,bbox_bottom, "Player", oDust)
		}

