/// @description Insert description here
// You can write your code in this editor

if xFrames == 0
{
	if add{gpu_set_blendmode(bm_add)};
	
	draw_sprite_ext(
	sprite,
	frame,
	x,
	y,
	xMod,
	yMod,
	rot,
	col,
	round_Ext(alpha,0.25)
	);
	
	gpu_set_blendmode(bm_normal);
	
	xFrames = xReset;
}

xFrames--;


