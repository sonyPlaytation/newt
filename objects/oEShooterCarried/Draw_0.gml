/// @description Insert description here
// You can write your code in this editor


draw_self();

if (flash > 0)
{
	flash--;
	shader_set(shWhiteFlash);
	draw_self();
	shader_reset();
}


var markerX;
var markerY;


markerX = x + (sign(image_xscale) * 2);

if (state = carriedstates.alert) and (markerTime > 0)
{
	
	draw_sprite_ext(sExclamEnemy,0,markerX,y-44,1,1,0,c_white,1);
}

//draw_text(x,y, string(facingRight));

