/// @description Insert description here
// You can write your code in this editor

if instance_exists(oNewt)
{
	if !oNewt.inspect
	{
		draw_sprite_ext(
		sprite_index,
		image_index,
		x-lengthdir_x(current_recoil,image_angle),
		y-lengthdir_y(current_recoil,image_angle),
		image_xscale,
		image_yscale,
		image_angle,
		image_blend,
		image_alpha
		);
	}
}

if draw_alpha > 0 and (hitSprite != undefined)
{
	var _aRound = round_Ext(draw_alpha,0.5);
	
	//GLOW
	gpu_set_blendmode(bm_add)
	draw_sprite_ext(
	hitSprite,
	0,
	global.gunX,
	global.gunY,
	_aRound*1.05,
	_aRound*1.5,
	image_angle,
	c_white,
	0.25);
	
	//muzzle flash
	gpu_set_blendmode(bm_normal)
	draw_sprite_ext(
	hitSprite,
	0,
	global.gunX,
	global.gunY,
	_aRound*0.75,
	_aRound*0.75,
	image_angle,
	c_white,
	draw_alpha*2);
	
}
else if (hitSprite == undefined) {draw_alpha = 0};

draw_alpha *= 0.75;
