/// @description Insert description here
// You can write your code in this editor

sprite_index = sprite;
image_alpha = 0;

inBounds = false;
alpha = 0;

if !instance_exists(oHiddenText)
{
	
	mytext = instance_create_layer(x+xOffset,y+yOffset,layer,oHiddenText);
	with (mytext)
		{
			owner = other.id;
		}
	
	with(mytext)
		{
		sprite_index = other.sprite;
		}
	
}else mytext = noone