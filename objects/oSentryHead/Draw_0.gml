/// @description Insert description here
// You can write your code in this editor

draw_sprite_ext(sFakeLaser,1,x+lengthdir_x(-10,image_angle),selfCenter+lengthdir_y(-10,image_angle),1,1,image_angle,c_white,inSight);

if (flash > 0)
{
	flash--;
	shader_set(shWhiteFlash);
	draw_self();
	shader_reset();
	
	with (owner)
	{
		shader_set(shWhiteFlash);
		draw_self();
		shader_reset();
	}
}else draw_self();



if instance_exists(owner)
{
	var bar1Y = owner.y+2;
	var bar2Y = bar1Y+4;
	
	draw_set_color(c_black);
	draw_rectangle(owner.x-22,bar1Y,owner.x+22,bar1Y+4,false);
	
	draw_set_color(c_red);
	draw_rectangle(
	owner.x-22,
	bar1Y,
	lerp(owner.x-22,owner.x+22,hp/maxHP),
	bar1Y+4,
	false);
	
	draw_set_color(c_black);
	draw_rectangle(owner.x-22,bar2Y,owner.x+22,bar2Y+4,false);
	
	draw_set_color(c_yellow);
	draw_rectangle(
	owner.x-22,
	bar2Y,
	lerp(owner.x-22,owner.x+22,ammo/maxAmmo),
	bar2Y+2,
	false);
}
//if instance_exists(target)
//{
//	draw_arrow(x,selfCenter,target.x,target.y-(target.sprite_height/2),5);
//}





