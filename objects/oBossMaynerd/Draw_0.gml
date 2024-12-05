/// @description

sprite_index = sprite;

if sprite != sMaynerdDie
{
	event_inherited();
}
else
{
	var _range = 5
	var xShake = x + random_range(-_range,_range);
	var yShake = y + random_range(-_range,_range);
	draw_sprite(sprite,image_index,xShake,yShake);	
}


draw_text(x,bbox_top-24,stt);

