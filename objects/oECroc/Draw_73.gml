

var markerX;
var markerY;

markerX = x + (sign(image_xscale) * 2);

if (state = states.alert) and (markerTime > 0)
{
	draw_sprite_ext(sExclamEnemy,0,markerX,y-44,1,1,0,c_white,1);
}
