/// @description

if pause
{
	pauseAlpha = min(0.65,pauseAlpha+0.10);
	draw_set_color(#221428);
	draw_set_alpha(pauseAlpha);
	draw_rectangle(0,0,RESOLUTION_W,RESOLUTION_H,0)
	draw_set_alpha(1);
	
	if !instance_exists(oMenuPause)
	{
		instance_create_depth(x,y,depth-1,oMenuPause)
	}
	
	var corner = 100;
	
	draw_sprite_ext(sLogo,0,RESOLUTION_W/2,RESOLUTION_H/3,0.5,0.5,0,c_white,pauseAlpha*1.5)
	
}
else
{
	pauseAlpha = max(0, pauseAlpha - 0.05)
}